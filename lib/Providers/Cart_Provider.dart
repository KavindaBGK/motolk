import 'dart:convert';

import 'package:flutter/material.dart';

// Mock JSON Data
const String jsonData = '''
[
  {
    "storeName": "Sri shopify",
    "items": [
      {
        "title": "AUDI A4 EVAPORATOR(NISSENS)",
        "price": 5396,
        "oldPrice": 6750,
        "quantity": 1,
        "image": "assets/images/engin.jpg"
      }
    ]
  },
  {
    "storeName": "LK Marte",
    "items": [
      {
        "title": "FORD ALTERNATOR(MAPCO)",
        "price": 13450,
        "oldPrice": null,
        "quantity": 1,
        "image": "assets/images/oil.jpg"
      }
    ]
  },
  {
    "storeName": "Perfect Deals",
    "items": [
      {
        "title": "HONDA ALTERNATOR(BLUE PRINT",
        "price": 255,
        "oldPrice": 1000,
        "quantity": 1,
        "image": "assets/images/brackpad.jpg"
      }
    ]
  }
]
''';

// Provider Class

class CartProvider with ChangeNotifier {
  List<dynamic> cartData = [];

  CartProvider() {
    loadJsonData();
  }

  void addToCart({
    required String? storeName,
    required String? title,
    required double? price,
    double? oldPrice,
    required int? quantity,
    required String? image,
  }) {
    // Find the store in the existing cart
    var store = cartData.firstWhere(
      (store) => store['storeName'] == storeName,
      orElse: () => null,
    );

    if (store != null) {
      // If the store exists, add the item to that store's items list
      store['items'].add({
        'title': title,
        'price': price,
        'oldPrice': oldPrice,
        'quantity': quantity,
        'image': image,
      });
    } else {
      // If the store does not exist, create a new store entry
      cartData.add({
        'storeName': storeName,
        'items': [
          {
            'title': title,
            'price': price,
            'oldPrice': oldPrice,
            'quantity': quantity,
            'image': image,
          }
        ],
      });
    }

    notifyListeners(); // Notify listeners about the change
  }

  void loadJsonData() {
    cartData = jsonDecode(jsonData);
    notifyListeners();
  }
}
