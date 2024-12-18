import 'package:flutter/material.dart';
import 'package:motolk/Pages/Checkout.dart';
import 'package:motolk/Providers/Cart_Provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Map<String, bool> _selectedItems = {};
  bool _selectAll = false;

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartProvider>(context).cartData;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF09416E), Color(0xFF0B81C6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: Text(
              "My Cart",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: cartData.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined,
                      size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    "Your cart is empty!",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text("Add items to get started."),
                ],
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _selectAll,
                        onChanged: (bool? value) {
                          setState(() {
                            _selectAll = value!;
                            for (int storeIndex = 0;
                                storeIndex < cartData.length;
                                storeIndex++) {
                              for (int itemIndex = 0;
                                  itemIndex <
                                      cartData[storeIndex]['items'].length;
                                  itemIndex++) {
                                String key = '$storeIndex-$itemIndex';
                                _selectedItems[key] = _selectAll;
                              }
                            }
                          });
                        },
                      ),
                      Text('Select All'),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartData.length,
                    itemBuilder: (context, storeIndex) {
                      final store = cartData[storeIndex];
                      return Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // Shop icon with background color
                                  CircleAvatar(
                                    backgroundColor: Colors.orange.shade100,
                                    radius: 16,
                                    child: const Icon(Icons.store,
                                        color: Colors.orange, size: 20),
                                  ),
                                  SizedBox(
                                      width:
                                          10), // Add space between icon and text
                                  // Shop name text
                                  Text(
                                    store['storeName'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(color: Colors.grey[300]),
                              ...store['items'].map<Widget>((item) {
                                int itemIndex = store['items'].indexOf(item);
                                String key = '$storeIndex-$itemIndex';
                                return Column(
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          item['image'],
                                          width: 65,
                                          height: 65,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      title: Text(item['title']),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Rs. ${item['price']}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          if (item['oldPrice'] != null)
                                            Text(
                                              "Rs. ${item['oldPrice']}",
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.grey,
                                              ),
                                            ),
                                        ],
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Checkbox(
                                            value: _selectedItems[key] ?? false,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                _selectedItems[key] = value!;
                                              });
                                              _updateSelectAllState();
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.remove),
                                            onPressed: () {
                                              setState(() {
                                                item['quantity']--;
                                              });
                                            },
                                          ),
                                          Text(
                                            item['quantity'].toString(),
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () {
                                              setState(() {
                                                item['quantity']++;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "Rs. ${calculateTotal(cartData)}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Get selected items
                              List selectedItems = _getSelectedItems(cartData);
                              print(selectedItems);
                              // Navigate to Checkout screen with selected items
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CheckoutPage(cartItems: selectedItems),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    "Check Out (0)"), // Add cart item count here
                                Icon(Icons.arrow_forward_ios, size: 18),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 12.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping Fee:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "Rs. 0", // Add your dynamic shipping fee value here
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }

  double calculateTotal(List cartData) {
    double total = 0.0;

    for (int storeIndex = 0; storeIndex < cartData.length; storeIndex++) {
      final store = cartData[storeIndex];
      for (int itemIndex = 0; itemIndex < store['items'].length; itemIndex++) {
        final item = store['items'][itemIndex];
        String key = '$storeIndex-$itemIndex'; // Unique key for each item

        // Only add the price if the item is selected
        if (_selectedItems[key] == true) {
          total += item['price'] * item['quantity'];
        }
      }
    }

    return double.parse(total.toStringAsFixed(2));
  }

  void _updateSelectAllState() {
    final allSelected = _selectedItems.values.every((isSelected) => isSelected);
    setState(() {
      _selectAll = allSelected;
    });
  }

  List _getSelectedItems(List cartData) {
    List selectedItems = [];

    for (int storeIndex = 0; storeIndex < cartData.length; storeIndex++) {
      final store = cartData[storeIndex];
      for (int itemIndex = 0; itemIndex < store['items'].length; itemIndex++) {
        final item = store['items'][itemIndex];
        String key = '$storeIndex-$itemIndex'; // Unique key for each item

        // Add the item to selectedItems if it is selected
        if (_selectedItems[key] == true) {
          selectedItems.add(item); // Add item to selectedItems
        }
      }
    }

    return selectedItems;
  }
}
