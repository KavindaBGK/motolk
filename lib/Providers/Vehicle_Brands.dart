import 'dart:convert';

import 'package:flutter/material.dart';

class VehicalBrandProvider with ChangeNotifier {
  static const _jsonBrandData = '''
[
  {
    "type": "All",
    "brands": [
      "All"
    ]
  },
  {
    "type": "Car",
    "brands": [
      "Toyota",
      "Nissan",
      "Audi",
      "Honda",
      "Suzuki",
      "Hyundai",
      "Kia",
      "Mercedes-Benz",
      "BMW",
      "Volkswagen",
      "Mazda"
    ]
  },
  {
    "type": "Bus",
    "brands": [
      "Isuzu",
      "Ashok Leyland",
      "Tata",
      "Yutong",
      "Mitsubishi Fuso",
      "Hyundai",
      "Mercedes-Benz"
    ]
  },
  {
    "type": "Van",
    "brands": [
      "Toyota HiAce",
      "Nissan Caravan",
      "Suzuki Every",
      "Hyundai H-1",
      "Kia Carnival"
    ]
  },
  {
    "type": "Cab",
    "brands": [
      "Toyota Hilux",
      "Nissan Navara",
      "Isuzu D-Max",
      "Mahindra Bolero",
      "Mitsubishi L200"
    ]
  },
  {
    "type": "Tipper",
    "brands": [
      "Tata",
      "Ashok Leyland",
      "Mahindra",
      "Isuzu",
      "Mitsubishi Fuso"
    ]
  },
  {
    "type": "SUV",
    "brands": [
      "Toyota Prado",
      "Nissan Patrol",
      "Jeep Wrangler",
      "Mitsubishi Montero",
      "Kia Sportage",
      "Hyundai Santa Fe"
    ]
  },
  {
    "type": "Lorry",
    "brands": [
      "Tata",
      "Ashok Leyland",
      "Mahindra",
      "Isuzu",
      "Mitsubishi Fuso"
    ]
  },
  {
    "type": "Three-wheel",
    "brands": [
      "Bajaj",
      "TVS King",
      "Piaggio",
      "Mahindra"
    ]
  },
  {
    "type": "Tractor",
    "brands": [
      "Massey Ferguson",
      "John Deere",
      "Mahindra",
      "Kubota",
      "Solis"
    ]
  },
  {
    "type": "Heavy-Duty",
    "brands": [
      "Caterpillar",
      "Komatsu",
      "JCB",
      "Liebherr",
      "Volvo"
    ]
  },
  {
    "type": "Motorcycle",
    "brands": [
      "Honda",
      "Yamaha",
      "Bajaj",
      "TVS",
      "Kawasaki",
      "Suzuki",
      "Hero"
    ]
  }
]''';

  List<Map<String, dynamic>> get jsonBrandData {
    return List<Map<String, dynamic>>.from(json.decode(_jsonBrandData));
  }
}
