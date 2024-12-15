import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:bubble/bubble.dart';

String iduser = '82091008-a484-4a89-ae75-a22bf8d6f3ac';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late IO.Socket socket;
  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  @override
  void initState() {
    super.initState();
    _listenForFirestoreUpdates();
    _loadMessagesFromDatabase();
    _connectToSocket();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    // Prepare data to send to the backend
    final data = {
      "sender_name": "Keshara", // Replace with actual sender name
      "receiver_id": "1234", // Replace with receiver's ID
      "sender_id": _user.id,
      "message": message.text,
    };

    // Send data to the backend via WebSocket or HTTP
    await http.post(
      Uri.parse(
          'http://192.168.43.26:5000/send-message'), // Replace <backend-url> with your backend URL
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    // Add message to local chat
    _addMessage(textMessage);
  }

  // void _loadMessagesFromDatabase() async {
  //   try {
  //     final querySnapshot = await FirebaseFirestore.instance
  //         .collection('messages')
  //         .where('sender_id', isEqualTo: _user.id) // Filter by sender ID
  //         .orderBy('timestamp', descending: true)
  //         .get();

  //     final messages = querySnapshot.docs.map((doc) {
  //       final data = doc.data();
  //       return types.TextMessage(
  //         id: doc.id,
  //         author: types.User(
  //           id: data['sender_id'] ?? '',
  //           firstName: data['sender_name'] ?? '',
  //         ),
  //         text: data['message'] ?? '',
  //         createdAt:
  //             (data['timestamp'] as Timestamp).toDate().millisecondsSinceEpoch,
  //       );
  //     }).toList();

  //     setState(() {
  //       _messages = messages;
  //     });
  //   } catch (error) {
  //     print('Error loading messages: $error');
  //   }
  // }

  void _sortMessagesByTimestamp() {
    _messages.sort((a, b) {
      final aTimestamp = a.createdAt ?? 0; // Treat null as 0 (or large number)
      final bTimestamp = b.createdAt ?? 0;
      return bTimestamp.compareTo(aTimestamp);
    });

    setState(() {
      print(_messages);
    });
  }

  void _connectToSocket() {
    socket = IO.io(
      'http://192.168.43.26:5000', // Replace with your backend's IP or domain
      IO.OptionBuilder()
          .setTransports(['websocket']) // Enable WebSocket transport
          .disableAutoConnect()
          .build(),
    );

    socket.connect();
    socket.onConnect((_) {
      print("Connected to WebSocket");
    });

    socket.on('message-${_user.id}', (data) {
      print("Message received: $data");
      final newMessage = types.TextMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: data['message_id'],
        text: data['message'],
      );

      setState(() {
        _messages.insert(0, newMessage);
      });
    });

    socket.onDisconnect((_) {
      print("Disconnected from WebSocket");
    });
  }

  // void _listenForFirestoreUpdates() {
  //   print("call this fun");
  //   FirebaseFirestore.instance
  //       .collection('messages')
  //       .where('receiver_id', isEqualTo: iduser)
  //       .orderBy('timestamp', descending: true)
  //       .snapshots()
  //       .listen((snapshot) {
  //     setState(() {
  //       _messages = snapshot.docs.map((doc) {
  //         final messageData = doc.data();
  //         print("call this fun $messageData");
  //         // Extract necessary fields from Firestore document
  //         final messageText = messageData['message'];
  //         final senderId = messageData['sender_id'];
  //         final senderName = messageData['sender_name'];
  //         final timestamp = messageData['timestamp'];

  //         // Return a new TextMessage with the appropriate details
  //         return types.TextMessage(
  //           author:
  //               types.User(id: senderId), // Set sender's ID and name as author
  //           createdAt: timestamp?.millisecondsSinceEpoch ??
  //               DateTime.now().millisecondsSinceEpoch,
  //           id: doc.id,
  //           text: messageText,
  //         );
  //       }).toList();
  //     });
  //   });
  //   print("call this fun2");
  // }

  void _loadMessagesFromDatabase() async {
    try {
      // Fetch sent messages from Firestore
      final querySnapshot = await FirebaseFirestore.instance
          .collection('messages')
          .where('sender_id', isEqualTo: _user.id) // Filter by sender ID
          .orderBy('timestamp', descending: true)
          .get();

      final messages = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return types.TextMessage(
          id: doc.id,
          author: types.User(
            id: data['sender_id'] ?? '',
            firstName: data['sender_name'] ?? '',
          ),
          text: data['message'] ?? '',
          createdAt:
              (data['timestamp'] as Timestamp).toDate().millisecondsSinceEpoch,
        );
      }).toList();

      setState(() {
        // Merge the fetched sent messages with the existing received messages
        _messages.insertAll(0,
            messages); // Adding at the start so that new messages appear at the top
        _sortMessagesByTimestamp();
      });
    } catch (error) {
      print('Error loading messages: $error');
    }
  }

  void _listenForFirestoreUpdates() {
    FirebaseFirestore.instance
        .collection('messages')
        .where('receiver_id', isEqualTo: iduser) // Listen for received messages
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      final newMessages = snapshot.docs.map((doc) {
        final messageData = doc.data();
        return types.TextMessage(
          author: types.User(id: messageData['sender_id']),
          createdAt: (messageData['timestamp'] as Timestamp)
              .toDate()
              .millisecondsSinceEpoch,
          id: doc.id,
          text: messageData['message'],
        );
      }).toList();

      setState(() {
        // Merge received messages with the existing ones
        _messages.insertAll(0, newMessages); // Add received messages at the top
        _sortMessagesByTimestamp();
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Chat Page',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor:
              const Color.fromARGB(255, 9, 65, 110), // Simple AppBar color
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white
              ], // Gradient for the background
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.only(
              bottom: 16.0, left: 5, right: 8), // Adds bottom padding
          child: Chat(
            theme: const DefaultChatTheme(
              inputBackgroundColor: Colors.black,
            ),
            messages: _messages,
            onAttachmentPressed: _handleAttachmentPressed,
            onMessageTap: _handleMessageTap,
            onPreviewDataFetched: _handlePreviewDataFetched,
            onSendPressed: _handleSendPressed,
            showUserAvatars: true,
            showUserNames: true,
            user: _user,
            bubbleBuilder: _bubbleBuilder,
          ),
        ),
      );

  // Define the bubbleBuilder function outside the build method
  Widget _bubbleBuilder(
    Widget child, {
    required dynamic message, // Assuming message can be of any type
    required bool nextMessageInGroup,
  }) {
    // Determine if the message is sent by the current user
    final bool isSentByCurrentUser = message.author.id == _user.id;

    print("Message: $isSentByCurrentUser");
    print("NextMessageInGroup: $nextMessageInGroup");

    return Align(
      alignment: isSentByCurrentUser
          ? Alignment.centerRight
          : Alignment.centerLeft, // Align messages based on sender
      child: Bubble(
        child: child,
        color: isSentByCurrentUser || message.type == types.MessageType.image
            ? const Color(0xff6f61e8) // Color for current user's messages
            : const Color(0xfff5f5f7), // Color for other messages
        margin: nextMessageInGroup
            ? const BubbleEdges.symmetric(horizontal: 6)
            : null, // Add margin if it's part of a group
        nip: nextMessageInGroup
            ? BubbleNip.no
            : isSentByCurrentUser
                ? BubbleNip.rightBottom // Tail for sent messages
                : BubbleNip.leftBottom, // Tail for received messages
      ),
    );
  }
}
