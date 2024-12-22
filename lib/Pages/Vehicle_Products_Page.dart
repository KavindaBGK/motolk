import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/Catagory_Data.dart';
import '../Providers/Product_Data.dart';
import '../Components/Product_Card.dart';
import '../Providers/Vehicle_Brands.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'Product_Details.dart';

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
        automaticallyImplyLeading:
            true, // Enables the back button automatically
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            widget.category,
            key: ValueKey(widget.category),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set text color to white
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          height: 164,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF09416E), Color(0xFF0B81C6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Add back arrow
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Notification action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Dropdowns and Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dropdowns
                  Row(
                    children: [
                      // Car Brand Dropdown
                      Expanded(
                        child: DropdownButtonFormField2(
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
                          decoration: InputDecoration(
                            labelText: "Select brand",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Category Dropdown
                      Expanded(
                        child: DropdownButtonFormField2(
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
                          decoration: InputDecoration(
                            labelText: "Category",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Search Bar
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search spare parts',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 16,
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
          const SizedBox(height: 10),
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
                      return GestureDetector(
                        onTap: () {
                          // Handle single tap on the product card
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                imageUrl: product[
                                    "imagePath"], // Pass product details
                                price: product["price"],
                                discount: product["discount"],
                                title: product["title"],
                                additionalImages: [
                                  product['imagePath']
                                ], //product.additionalImages
                                deliveryDate: 'Dec 12 - 26',
                                shopId: product['shopid'],
                                delivary: product['delivary'],
                                description: product['description'],
                              ),
                            ),
                          );
                        },
                        child: ProductCard(product: product),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
