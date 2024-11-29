import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  // Initial list of categories with added title key
  final List<Map<String, String>> _categories = [
    {
      "image": "assets/images/bodyparts.jpg",
      "name": "Body Parts\n",
      "title": "Body Parts"
    },
    {
      "image": "assets/images/brack.jpg",
      "name": "Brakes System\n",
      "title": "Brakes System"
    },
    {
      "image": "assets/images/aircondtion.jpg",
      "name": "Cooling\nSystem",
      "title": "Cooling System"
    },
    {
      "image": "assets/images/cool.jpg",
      "name": "Air\nConditioning",
      "title": "Air Conditioning"
    },
    {
      "image": "assets/images/Clutch.jpg",
      "name": "Clutch/Attachment\nParts",
      "title": "Clutch/Attachment Parts"
    },
    {
      "image": "assets/images/driveshaft.jpg",
      "name": "Drive Shaft\n",
      "title": "Drive Shaft"
    },
    {
      "image": "assets/images/electric.jpg",
      "name": "Electrics Parts\n",
      "title": "Electrics Parts"
    },
    {
      "image": "assets/images/engin.jpg",
      "name": "Engine Parts\n",
      "title": "Engine Parts"
    },
    {
      "image": "assets/images/ExhaustSystem.jpg",
      "name": "Exhaust System\n",
      "title": "Exhaust System"
    },
    {
      "image": "assets/images/Filters.jpg",
      "name": "Filters\n",
      "title": "Filters"
    },
    {
      "image": "assets/images/en.jpg",
      "name": "Fuel Supply\nSystem",
      "title": "Fuel Supply System"
    },
    {
      "image": "assets/images/en.jpg",
      "name": "Fuel Mixture\nFormation",
      "title": "Fuel Mixture Formation"
    },
    {
      "image": "assets/images/en.jpg",
      "name": "Interior\nEquipment",
      "title": "Interior Equipment"
    },
    {
      "image": "assets/images/en.jpg",
      "name": "Heating &\nVentilation",
      "title": "Heating & Ventilation"
    },
    {
      "image": "assets/images/en.jpg",
      "name": "Maintenance\nService Parts",
      "title": "Maintenance Service Parts"
    },
    {
      "image": "assets/images/en.jpg",
      "name": "Suspension &\nDamping",
      "title": "Suspension & Damping"
    },
    {
      "image": "assets/images/en.jpg",
      "name": "Suspension &\nSteering",
      "title": "Suspension & Steering"
    },
    {
      "image": "assets/images/en.jpg",
      "name": "Transmission\n",
      "title": "Transmission"
    },
    {
      "image": "assets/images/en.jpg",
      "name": "Spark/Glow\nIgnition",
      "title": "Spark/Glow Ignition"
    },
    {
      "image": "assets/images/en.jpg",
      "name": "Window\nCleaning",
      "title": "Window Cleaning"
    },
    {"image": "assets/images/en.jpg", "name": "Others\n", "title": "Others"},
  ];

  // Getter function to return the list of categories
  List<Map<String, String>> get categories {
    return _categories;
  }

  // Optionally, you can add a method to add new categories
  void addCategory(Map<String, String> category) {
    _categories.add(category);
    notifyListeners();
  }
}
