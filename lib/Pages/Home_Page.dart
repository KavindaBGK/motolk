import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:motolk/Pages/Vehicle_Products_Page.dart';
import 'package:provider/provider.dart';

import '../Components/Home_Container.dart';
import '../Components/Product_Card.dart';
import '../Components/Vehicle_Type_Container.dart';
import '../Components/catagort.dart';
import '../Providers/Catagory_Data.dart';
import '../Providers/Product_Data.dart';
import '../Providers/Vehical_Type.dart';
import 'Category_Products_Page.dart';
import 'Product_Details.dart';

late List<Map<String, String>> categories;
const jsonData = '''
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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    final List<Map<String, dynamic>> parsedData =
        (json.decode(jsonData) as List<dynamic>)
            .map((e) => e as Map<String, dynamic>)
            .toList();

    return Scaffold(body:
        Consumer<ProductProvider>(builder: (context, productProvider, child) {
      final products = productProvider.filteredProducts;
      final vehicleTypeProvider =
          Provider.of<VehicalTypeProvider>(context, listen: false);
      final vehicles = vehicleTypeProvider.vehicles;
      final categories =
          Provider.of<CategoryProvider>(context, listen: false).categories;

      return Stack(
        children: [
          Container(
            height: 164,
            color: Color.fromARGB(255, 9, 65, 110),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Keshara!',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white, // Text color for contrast
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'What do you want to buy?',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color:
                          Colors.white, // Background color for the search bar
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(0.5), // Shadow color with opacity
                          spreadRadius: 1, // Spread radius of the shadow
                          blurRadius: 5, // Blur radius for a soft shadow
                          offset: Offset(0, 3), // Position of the shadow (x, y)
                        ),
                      ],
                    ),
                    child: SizedBox(
                      height: 60, // Desired height of the search bar
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search Spare-parts for buy',
                          prefixIcon: Icon(Icons.search),
                          border:
                              InputBorder.none, // Removes the default border
                          contentPadding: EdgeInsets.symmetric(
                            vertical:
                                20, // Adjust this for better text alignment
                            horizontal: 17, // Padding inside the search bar
                          ),
                        ),
                        onChanged: (query) {
                          // Pass the query to the provider's search method
                          productProvider.searchProducts(query);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableContainer(
                            data: parsedData,
                          ),
                          const SizedBox(height: 25),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Vehicle Type',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Action for "See all"
                                    print("See all categories pressed");
                                  },
                                  child: const Text(
                                    'See all',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: vehicles.map((vehicle) {
                                  return VehicleTypeContainer(
                                    backgroundImage:
                                        vehicle["backgroundImage"]!,
                                    title: vehicle["title"]!,
                                    buttonText: "explore more >>",
                                    onButtonPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VehicleProductsPage(
                                                  category:
                                                      vehicle["vehicle type"]!),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Categories',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Action for "See all"
                                    print("See all categories pressed");
                                  },
                                  child: const Text(
                                    'See all',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: categories.map((category) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CircularCategory(
                                    imagePath: category["image"]!,
                                    name: category["name"]!,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryProductsPage(
                                                  category: category["title"]!),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                // Calculate width for two columns
                                double itemWidth =
                                    (constraints.maxWidth - 8) / 2;
                                return Wrap(
                                  spacing:
                                      8.0, // Horizontal spacing between items
                                  runSpacing:
                                      8.0, // Vertical spacing between rows
                                  children: products.map((product) {
                                    return SizedBox(
                                      width:
                                          itemWidth, // Ensure two items fit per row
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailsPage(
                                                imageUrl: product[
                                                    "imagePath"], // Pass product details
                                                price: product["price"],
                                                discount: product["discount"],
                                                title: product["title"],
                                                additionalImages: [
                                                  product['imagePath']
                                                ], //product.additionalImages
                                                deliveryDate: 'Dec 12 - 26',
                                              ),
                                            ),
                                          );
                                        },
                                        child: ProductCard(
                                          product: product,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }));
  }
}
