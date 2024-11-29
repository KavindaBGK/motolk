import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/Catagory_Data.dart';
import '../Providers/Product_Data.dart';
import '../Components/Product_Card.dart';
import '../Providers/Vehicle_Brands.dart';

// Define JSON data as constants
const jsonBrandData = '''
[
  "Toyota",
  "Nissan",
  "Audi",
  "Honda"
]
''';

const jsonCategoryData = '''
[
  "Brakes",
  "Body Parts",
  "Brake Parts"
]
''';

class VehicleProductsPage extends StatefulWidget {
  final String category;

  const VehicleProductsPage({Key? key, required this.category})
      : super(key: key);

  @override
  _VehicleProductsPageState createState() => _VehicleProductsPageState();
}

class _VehicleProductsPageState extends State<VehicleProductsPage> {
  late TextEditingController _searchController;
  late List<dynamic> filteredProducts;
  late List<String> filteredBrands;
  late List<String> filteredCatagory;
  late List<String> carBrands;
  late List<String> categories;
  String selectedBrand = "All";
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    filteredBrands = [];
    carBrands = ["All"];
    categories = ["All"];
    filteredProducts = [];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final brandData = Provider.of<VehicalBrandProvider>(context).jsonBrandData;
    final CatagoryData = Provider.of<CategoryProvider>(context).categories;
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    setState(() {
      filteredBrands = [
        ...brandData
            .where((entry) => entry['type'] == widget.category)
            .expand((entry) => List<String>.from(entry['brands']))
      ];
      filteredCatagory = [
        ...CatagoryData.expand(
            (entry) => entry['title'] != null ? [entry['title']!] : []).toList()
      ];

      carBrands = ["All", ...filteredBrands];
      categories = ["All", ...filteredCatagory];

      filteredProducts = productProvider.products
          .where((product) => product['vehicle type'] == widget.category)
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterProducts(String query) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final allProducts = productProvider.products
        .where((product) => product['vehicle type'] == widget.category)
        .toList();
    setState(() {
      filteredProducts = allProducts
          .where((product) =>
              (selectedBrand == "All" ||
                  product['Brand']?.toLowerCase() ==
                      selectedBrand.toLowerCase()) &&
              (selectedCategory == "All" ||
                  product['category']?.toLowerCase() ==
                      selectedCategory.toLowerCase()) &&
              product['title']
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 9, 65, 110),
      ),
      body: Column(
        children: [
          // Dropdowns and Search Bar in one container
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dropdowns Row
                  Row(
                    children: [
                      // Car Brand Dropdown
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          value: selectedBrand,
                          items: carBrands
                              .map((brand) => DropdownMenuItem(
                                    value: brand,
                                    child: Text(brand),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedBrand = value!;
                              _filterProducts(_searchController.text);
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: "Select brand name",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Category Dropdown
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          value: selectedCategory,
                          items: categories
                              .map((category) => DropdownMenuItem(
                                    value: category,
                                    child: Text(category),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value!;
                              _filterProducts(_searchController.text);
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: "Category",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Search Bar
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search Spare-parts for buy',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 17,
                        ),
                      ),
                      onChanged: (query) {
                        _filterProducts(query);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Product Grid
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(
                    child: Text(
                      'No products available in this category.',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return ProductCard(product: product);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
