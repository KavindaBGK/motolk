// lib/providers/product_data.dart
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  // Sample product data (like from a database)
  final List<Map<String, dynamic>> _products = [
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "AUDI A4 EVAPORATOR(NISSENS)",
      "price": "62.62",
      "sold": "401 sold",
      "rating": 4.0,
      "cartCount": "",
      "discount": "5%",
      "isSale": false,
      "Brand": "Audi",
      "category": "Brakes",
      "vehicle type": "Car"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD ALTERNATOR(MAPCO)...",
      "price": "195.15",
      "sold": "179 sold",
      "rating": 2.5,
      "cartCount": "",
      "isSale": true,
      "discount": "-37%",
      "category": "Body Parts",
      "vehicle type": "Car"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "HONDA ALTERNATOR(BLUE PRINT)...",
      "price": "302.99",
      "sold": "700+ sold",
      "rating": 4.8,
      "cartCount": "",
      "isSale": false,
      "Brand": "Honda",
      "category": "Body Parts",
      "vehicle type": "Car"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Car"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Van"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Van"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Van"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Van"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Bus"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Bus"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Bus"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Bus"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Cab"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Cab"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Cab"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Cab"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Tipper"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Tipper"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Tipper"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Tipper"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "SUV"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "SUV"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "SUV"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "SUV"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Lorry"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Lorry"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Lorry"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Lorry"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Three-wheel"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Three-wheel"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Three-wheel"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Three-wheel"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Tractor"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Tractor"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Tractor"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Tractor"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Heavy-Duty"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Heavy-Duty"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Heavy-Duty"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Heavy-Duty"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Motorcycle"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Motorcycle"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Motorcycle"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "-60%",
      "category": "Body Parts",
      "vehicle type": "Motorcycle"
    },
  ];

  List<Map<String, dynamic>> _filteredProducts = [];
  List<Map<String, dynamic>> get products => _products;

  List<Map<String, dynamic>> get filteredProducts => _filteredProducts;

  ProductProvider() {
    _filteredProducts = _products;
  }

  void addProduct(Map<String, dynamic> product) {
    _products.add(product);
    notifyListeners();
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = _products; // Show all products if query is empty
    } else {
      _filteredProducts = _products
          .where((product) =>
              product['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners(); // Notify listeners to rebuild widgets using this provider
  }
}
