import 'package:flutter/material.dart';

class ReviewsDataProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _reviews = [
  {
    'shopId': 'SHP001',
    "rating": 5,
    "review":
        "Super recommend the purchase, low-cost smartwatch that delivers a lot, great build quality.",
    "author": "E***s",
    "date": "09 Nov 2024"
  },
  {
    'shopId': 'SHP001',
    "rating": 4,
    "review":
        "Amazing, it has what it promises, it delivers, it's comfortable, very good material.",
    "author": "Z***s",
    "date": "09 Nov 2024"
  },
  {
    'shopId': 'SHP001',
    "rating": 4,
    "review":
        "Amazing, it has what it promises, it delivers, it's comfortable, very good material.",
    "author": "Z***s",
    "date": "09 Nov 2024"
  },
  {
    'shopId': 'SHP001',
    "rating": 4,
    "review":
        "Amazing, it has what it promises, it delivers, it's comfortable, very good material.",
    "author": "Z***s",
    "date": "09 Nov 2024"
  },
  {
    'shopId': 'SHP002',
    "rating": 5,
    "review":
        "Super recommend the purchase, low-cost smartwatch that delivers a lot, great build quality.",
    "author": "E***s",
    "date": "09 Nov 2024"
  },
  {
    'shopId': 'SHP002',
    "rating": 4,
    "review":
        "Amazing, it has what it promises, it delivers, it's comfortable, very good material.",
    "author": "Z***s",
    "date": "09 Nov 2024"
  },
  {
    'shopId': 'SHP002',
    "rating": 4,
    "review":
        "Amazing, it has what it promises, it delivers, it's comfortable, very good material.",
    "author": "Z***s",
    "date": "09 Nov 2024"
  },
  {
    'shopId': 'SHP002',
    "rating": 4,
    "review":
        "Amazing, it has what it promises, it delivers, it's comfortable, very good material.",
    "author": "Z***s",
    "date": "09 Nov 2024"
  },
  {
    'shopId': 'SHP003',
    "rating": 5,
    "review":
        "Super recommend the purchase, low-cost smartwatch that delivers a lot, great build quality.",
    "author": "E***s",
    "date": "09 Nov 2024"
  },
  {
    'shopId': 'SHP003',
    "rating": 4,
    "review":
        "Amazing, it has what it promises, it delivers, it's comfortable, very good material.",
    "author": "Z***s",
    "date": "09 Nov 2024"
  },
  {
    'shopId': 'SHP003',
    "rating": 4,
    "review":
        "Amazing, it has what it promises, it delivers, it's comfortable, very good material.",
    "author": "Z***s",
    "date": "09 Nov 2024"
  },
  {
    'shopId': 'SHP003',
    "rating": 4,
    "review":
        "Amazing, it has what it promises, it delivers, it's comfortable, very good material.",
    "author": "Z***s",
    "date": "09 Nov 2024"
  }
];

  List<Map<String, dynamic>> get reviews => _reviews; //should change
 
}