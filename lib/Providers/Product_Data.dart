// lib/providers/product_data.dart
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  // Sample product data (like from a database)

  ///////////////////////This is hide ///////////////////////////////////////////////////
  final List<Map<String, dynamic>> _products_test = [
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
      "vehicle type": "Car",
      "shopid": "SHP001"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD ALTERNATOR(MAPCO)...",
      "price": "195.15",
      "sold": "179 sold",
      "rating": 2.5,
      "cartCount": "",
      "isSale": true,
      "discount": "37%",
      "Brand": "Ford",
      "category": "Body Parts",
      "vehicle type": "Car",
      "shopid": "SHP001"
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
      "vehicle type": "Car",
      "shopid": "SHP001"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "60%",
      "Brand": "Ford",
      "category": "Body Parts",
      "vehicle type": "Car",
      "shopid": "SHP001"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "60%",
      "category": "Body Parts",
      "vehicle type": "Van",
      "shopid": "SHP001"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "60%",
      "category": "Body Parts",
      "vehicle type": "Van",
      "shopid": "SHP001"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "60%",
      "category": "Body Parts",
      "vehicle type": "Van",
      "shopid": "SHP001"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "60%",
      "category": "Body Parts",
      "vehicle type": "Van",
      "shopid": "SHP001"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "60%",
      "category": "Body Parts",
      "vehicle type": "Bus",
      "shopid": "SHP001"
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
      "vehicle type": "Bus",
      "shopid": "SHP001"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "60%",
      "category": "Body Parts",
      "vehicle type": "Bus",
      "shopid": "SHP001"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "60%",
      "category": "Body Parts",
      "vehicle type": "Bus",
      "shopid": "SHP001"
    },
    {
      "imagePath": "assets/images/bodyparts.jpg",
      "title": "FORD injector nozzle(delphi)...",
      "price": "11,306.88",
      "sold": "148 sold",
      "rating": 4.0,
      "cartCount": "",
      "isSale": true,
      "discount": "60%",
      "category": "Body Parts",
      "vehicle type": "Cab",
      "shopid": "SHP001"
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
      "vehicle type": "Cab",
      "shopid": "SHP002"
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
      "vehicle type": "Cab",
      "shopid": "SHP002"
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
      "vehicle type": "Cab",
      "shopid": "SHP002"
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
      "vehicle type": "Tipper",
      "shopid": "SHP002"
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
      "vehicle type": "Tipper",
      "shopid": "SHP002"
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
      "vehicle type": "Tipper",
      "shopid": "SHP002"
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
      "vehicle type": "Tipper",
      "shopid": "SHP002"
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
      "vehicle type": "SUV",
      "shopid": "SHP002"
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
      "vehicle type": "SUV",
      "shopid": "SHP003"
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
      "vehicle type": "SUV",
      "shopid": "SHP003"
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
      "vehicle type": "SUV",
      "shopid": "SHP003"
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
      "vehicle type": "Lorry",
      "shopid": "SHP003"
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
      "vehicle type": "Lorry",
      "shopid": "SHP003"
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
      "vehicle type": "Lorry",
      "shopid": "SHP003"
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
      "vehicle type": "Lorry",
      "shopid": "SHP003"
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
      "vehicle type": "Three-wheel",
      "shopid": "SHP004"
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
      "vehicle type": "Three-wheel",
      "shopid": "SHP004"
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
      "vehicle type": "Three-wheel",
      "shopid": "SHP004",
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
      "vehicle type": "Three-wheel",
      "shopid": "SHP004"
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
      "vehicle type": "Tractor",
      "shopid": "SHP005"
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
      "vehicle type": "Tractor",
      "shopid": "SHP005"
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
      "vehicle type": "Tractor",
      "shopid": "SHP005"
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
      "vehicle type": "Tractor",
      "shopid": "SHP005"
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
      "vehicle type": "Heavy-Duty",
      "shopid": "SHP005"
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
      "Brand": "Ford",
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
      "Brand": "Ford",
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
  List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> _filteredProducts = [];

  final int _itemsPerBatch = 10;
  int _currentIndex = 0;

  List<Map<String, dynamic>> get products => _products_test; //should change
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
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products
          .where((product) =>
              product['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<void> loadInitialProducts() async {
    _currentIndex = 0; // Reset to first index when loading the initial data
    _products = await fetchProducts(); // Load the first batch
    _filteredProducts = _products;
    notifyListeners();
  }

  Future<void> loadMoreProducts() async {
    // Ensure we don't exceed the total number of products
    if (_currentIndex < _products_test.length) {
      List<Map<String, dynamic>> moreProducts = await fetchProducts();
      if (moreProducts.isNotEmpty) {
        _products.addAll(moreProducts); // Add the fetched products
        _filteredProducts = _products;
        notifyListeners();
      }
    }
  }

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay

    // Calculate the ending index for the batch
    int endIndex = _currentIndex + _itemsPerBatch;
    if (endIndex > _products_test.length) {
      endIndex =
          _products_test.length; // Don't exceed the total number of products
    }

    print("Fetching from index $_currentIndex to $endIndex");

    // Fetch the next batch of products
    List<Map<String, dynamic>> paginatedProducts =
        _products_test.sublist(_currentIndex, endIndex);

    // Update the current index for the next batch
    _currentIndex = endIndex;

    return paginatedProducts;
  }
}
