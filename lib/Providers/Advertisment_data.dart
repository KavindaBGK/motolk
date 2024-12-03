import 'dart:convert';

import 'package:flutter/material.dart';

class AdvertismentDataProvider with ChangeNotifier {
  static const jsonData = '''
  [
    {
      "backgroundImage": "assets/images/engin.jpg",
      "title": "Cheverolate Doge Alternator",
      "buttonText": "Buy Now",
      "onButtonPressed": null
    },
    {
      "backgroundImage": "assets/images/oil.jpg",
      "title": "50% Offer from our Store",
      "buttonText": "Shop Now",
      "onButtonPressed": null
    },
    {
      "backgroundImage": "assets/images/brackpad.jpg",
      "title": "Brake Pads Discount",
      "buttonText": "Order Now",
      "onButtonPressed": null
    }
  ]
  ''';

  List<Map<String, dynamic>> get parsedData {
    return List<Map<String, dynamic>>.from(json.decode(jsonData));
  }
}
