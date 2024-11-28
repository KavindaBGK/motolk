import 'package:flutter/material.dart';

class VehicalTypeProvider with ChangeNotifier {
  final List<Map<String, String>> _vehicles = [
    {
      "backgroundImage": "assets/images/car.jpg",
      "title": "Motor Car",
      "buttonText": "Buy Now",
      "vehicle type": "Car"
    },
    {
      "backgroundImage": "assets/images/bus.jpg",
      "title": "Bus",
      "buttonText": "Buy Now",
      "vehicle type": "Bus"
    },
    {
      "backgroundImage": "assets/images/van.jpg",
      "title": "Van",
      "buttonText": "Buy Now",
      "vehicle type": "Van"
    },
    {
      "backgroundImage": "assets/images/cab.jpg",
      "title": "Cab",
      "buttonText": "Buy Now",
      "vehicle type": "Cab"
    },
    {
      "backgroundImage": "assets/images/tipper.jpeg",
      "title": "Tipper",
      "buttonText": "Buy Now",
      "vehicle type": "Tipper"
    },
    {
      "backgroundImage": "assets/images/suv.jpg",
      "title": "SUV",
      "buttonText": "Buy Now",
      "vehicle type": "SUV"
    },
    {
      "backgroundImage": "assets/images/lorry.jpg",
      "title": "Lorry",
      "buttonText": "Buy Now",
      "vehicle type": "Lorry"
    },
    {
      "backgroundImage": "assets/images/threewheel.jpg",
      "title": "Three Wheel",
      "buttonText": "Buy Now",
      "vehicle type": "Three-wheel"
    },
    {
      "backgroundImage": "assets/images/tractor.jpg",
      "title": "Tractor",
      "buttonText": "Buy Now",
      "vehicle type": "Tractor"
    },
    {
      "backgroundImage": "assets/images/heavyduty.jpg",
      "title": "Heavy-Deuty",
      "buttonText": "Buy Now",
      "vehicle type": "Heavy-Duty"
    },
    {
      "backgroundImage": "assets/images/motorcycle.jpeg",
      "title": "Motorcycle",
      "buttonText": "Buy Now",
      "vehicle type": "Motorcycle"
    },
  ];

  List<Map<String, dynamic>> get vehicles => _vehicles;
}
