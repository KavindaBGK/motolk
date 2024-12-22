// lib/providers/product_data.dart
import 'package:flutter/material.dart';

class ShopsDataProvider with ChangeNotifier {
  // Sample product data (like from a database)

  ///////////////////////This is hide ///////////////////////////////////////////////////
  final List<Map<String, dynamic>> _Shopdata = [
    {
      'shopId': 'SHP001',
      'backgroundImage': 'assets/images/Shop1.jpg',
      'shopdp': 'assets/images/Shop2.jpg',
      'title': 'Auto Spares Hub',
      'subtitle': 'Your one-stop auto shop',
      'titleColor': Colors.white,
      'subtitleColor': Colors.white70,
      'buttonText': 'Shop Now',
      'rating': 4.8,
      'mobileNumber': '+1234567890',
      'email': 'contact@autospareshub.com',
      'googleMapLocation': 'https://goo.gl/maps/example1',
      'address':'',
      'Vision':'',
      'Mission':'',
      'services':[],
      
    },
    {
      'shopId': 'SHP002',
      'backgroundImage': 'assets/images/Shop2.jpg',
      'shopdp': 'assets/images/Shop2.jpg',
      'title': 'SpareParts Central',
      'subtitle': 'Reliable parts, best prices',
      'titleColor': Colors.white,
      'subtitleColor': Colors.white70,
      'buttonText': 'Explore Now',
      'rating': 4.6,
      'mobileNumber': '+1987654321',
      'email': 'info@sparepartscentral.com',
      'googleMapLocation': 'https://goo.gl/maps/example2',
    },
    {
      'shopId': 'SHP003',
      'backgroundImage': 'assets/images/Shop3.jpg',
      'shopdp': 'assets/images/Shop2.jpg',
      'title': 'DriveSmart',
      'subtitle': 'Premium vehicle parts',
      'titleColor': Colors.white,
      'subtitleColor': Colors.white70,
      'buttonText': 'Discover Deals',
      'rating': 4.7,
      'mobileNumber': '+1478523690',
      'email': 'support@drivesmart.com',
      'googleMapLocation': 'https://goo.gl/maps/example3',
    },
    {
      'shopId': 'SHP004',
      'backgroundImage': 'assets/images/Shop4.jpg',
      'shopdp': 'assets/images/Shop2.jpg',
      'title': 'MotorCare Essentials',
      'subtitle': 'Your car deserves the best',
      'titleColor': Colors.white,
      'subtitleColor': Colors.white70,
      'buttonText': 'Shop Now',
      'rating': 4.5,
      'mobileNumber': '+1122334455',
      'email': 'contact@motorcareessentials.com',
      'googleMapLocation': 'https://goo.gl/maps/example4',
    },
    {
      'shopId': 'SHP005',
      'backgroundImage': 'assets/images/Shop5.jpg',
      'shopdp': 'assets/images/Shop2.jpg',
      'title': 'AutoTech Zone',
      'subtitle': 'Quality parts guaranteed',
      'titleColor': Colors.white,
      'subtitleColor': Colors.white70,
      'buttonText': 'Shop Now',
      'rating': 4.9,
      'mobileNumber': '+1555444333',
      'email': 'info@autotechzone.com',
      'googleMapLocation': 'https://goo.gl/maps/example5',
    },
    {
      'shopId': 'SHP006',
      'backgroundImage': 'assets/images/Shop1.jpg',
      'shopdp': 'assets/images/Shop2.jpg',
      'title': 'RoadMasters Parts',
      'subtitle': 'Keeping your wheels rolling',
      'titleColor': Colors.white,
      'subtitleColor': Colors.white70,
      'buttonText': 'Find Now',
      'rating': 4.4,
      'mobileNumber': '+1666777888',
      'email': 'support@roadmastersparts.com',
      'googleMapLocation': 'https://goo.gl/maps/example6',
    },
    {
      'shopId': 'SHP007',
      'backgroundImage': 'assets/images/Shop2.jpg',
      'shopdp': 'assets/images/Shop2.jpg',
      'title': 'SpeedySpare Shop',
      'subtitle': 'Fast parts, faster delivery',
      'titleColor': Colors.white,
      'subtitleColor': Colors.white70,
      'buttonText': 'Shop Now',
      'rating': 4.6,
      'mobileNumber': '+1777888999',
      'email': 'contact@speedyspare.com',
      'googleMapLocation': 'https://goo.gl/maps/example7',
    },
    {
      'shopId': 'SHP008',
      'backgroundImage': 'assets/images/Shop3.jpg',
      'shopdp': 'assets/images/Shop2.jpg',
      'title': 'ProParts Warehouse',
      'subtitle': 'Professional-grade auto spares',
      'titleColor': Colors.white,
      'subtitleColor': Colors.white70,
      'buttonText': 'Explore Now',
      'rating': 4.3,
      'mobileNumber': '+1888999000',
      'email': 'info@propartswarehouse.com',
      'googleMapLocation': 'https://goo.gl/maps/example8',
    },
    {
      'shopId': 'SHP009',
      'backgroundImage': 'assets/images/Shop4.jpg',
      'shopdp': 'assets/images/Shop2.jpg',
      'title': 'EcoDrive Parts',
      'subtitle': 'Eco-friendly vehicle solutions',
      'titleColor': Colors.white,
      'subtitleColor': Colors.white70,
      'buttonText': 'Learn More',
      'rating': 4.7,
      'mobileNumber': '+1999000111',
      'email': 'support@ecodriveparts.com',
      'googleMapLocation': 'https://goo.gl/maps/example9',
    },
    {
      'shopId': 'SHP010',
      'backgroundImage': 'assets/images/Shop5.jpg',
      'shopdp': 'assets/images/Shop2.jpg',
      'title': 'AllAuto Spares',
      'subtitle': 'Wide range, best prices',
      'titleColor': Colors.white,
      'subtitleColor': Colors.white70,
      'buttonText': 'Shop Now',
      'rating': 4.8,
      'mobileNumber': '+1001122333',
      'email': 'contact@allautospares.com',
      'googleMapLocation': 'https://goo.gl/maps/example10',
    },
  ];

  List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> _filteredShop = [];

  final int _itemsPerBatch = 10;
  int _currentIndex = 0;

  List<Map<String, dynamic>> get products => _Shopdata; //should change
  List<Map<String, dynamic>> get filteredShop => _filteredShop;

  ProductProvider() {
    _filteredShop = _products;
  }

  void addProduct(Map<String, dynamic> product) {
    _products.add(product);
    notifyListeners();
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      _filteredShop = _products;
    } else {
      _filteredShop = _products
          .where((product) =>
              product['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<void> loadInitialProducts() async {
    _currentIndex = 0; // Reset to first index when loading the initial data
    _products = await fetchProducts(); // Load the first batch
    _filteredShop = _products;
    notifyListeners();
  }

  Future<void> loadMoreProducts() async {
    // Ensure we don't exceed the total number of products
    if (_currentIndex < _Shopdata.length) {
      List<Map<String, dynamic>> moreProducts = await fetchProducts();
      if (moreProducts.isNotEmpty) {
        _products.addAll(moreProducts); // Add the fetched products
        _filteredShop = _products;
        notifyListeners();
      }
    }
  }

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay

    // Calculate the ending index for the batch
    int endIndex = _currentIndex + _itemsPerBatch;
    if (endIndex > _Shopdata.length) {
      endIndex = _Shopdata.length; // Don't exceed the total number of products
    }

    print("Fetching from index $_currentIndex to $endIndex");

    // Fetch the next batch of products
    List<Map<String, dynamic>> paginatedProducts =
        _Shopdata.sublist(_currentIndex, endIndex);

    // Update the current index for the next batch
    _currentIndex = endIndex;

    return paginatedProducts;
  }
}
