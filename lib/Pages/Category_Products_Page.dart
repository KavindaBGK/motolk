import 'package:flutter/material.dart';
import 'package:motolk/Pages/Product_Details.dart';
import 'package:provider/provider.dart';
import '../Providers/Product_Data.dart';
import '../Components/Product_Card.dart';

class CategoryProductsPage extends StatelessWidget {
  final String category;

  const CategoryProductsPage({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final TextEditingController _searchController = TextEditingController();
    List<dynamic> filteredProducts = productProvider.products
        .where((product) => product['category'] == category)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 9, 65, 110),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color for the search bar
                borderRadius: BorderRadius.circular(12), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Shadow color with opacity
                    spreadRadius: 1, // Spread radius of the shadow
                    blurRadius: 5, // Blur radius for a soft shadow
                    offset: const Offset(0, 3), // Position of the shadow (x, y)
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
                    border: InputBorder.none, // Removes the default border
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20, // Adjust this for better text alignment
                      horizontal: 17, // Padding inside the search bar
                    ),
                  ),
                  onChanged: (query) {
                    // Filter products based on the search query
                    filteredProducts = productProvider.products
                        .where((product) =>
                            product['category'] == category &&
                            product['name']
                                .toString()
                                .toLowerCase()
                                .contains(query.toLowerCase()))
                        .toList();
                  },
                ),
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
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two items per row
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.75, // Adjust for item height
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
