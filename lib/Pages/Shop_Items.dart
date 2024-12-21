import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/Product_Card.dart';
import '../Providers/Product_Data.dart';
import 'Product_Details.dart';

class ShopItemsScreen extends StatelessWidget {
  final String shopId;
  final String backgroundImage;
  final String title;
  final double rating;

  const ShopItemsScreen({
    Key? key,
    required this.shopId,
    required this.backgroundImage,
    required this.title,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productTypeProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final filteredProducts = productTypeProvider.products
        .where((product) => product['shopid'] == shopId)
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Background Image and Header Section
          Stack(
            children: [
              Image.asset(
                backgroundImage,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1.5),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/Shop2.jpg",
                            fit: BoxFit
                                .cover, // Ensures the image fills the circular shape
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            Text(
                              ' $rating',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                children: [
                  filteredProducts.isEmpty
                      ? const Center(
                          child: Text(
                            'No products available in this category.',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true, // Key to prevent layout issues
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(16.0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 9.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: filteredProducts.length,
                          itemBuilder: (context, index) {
                            final product = filteredProducts[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsPage(
                                      imageUrl: product["imagePath"],
                                      price: product["price"],
                                      discount: product["discount"],
                                      title: product["title"],
                                      additionalImages: [product['imagePath']],
                                      deliveryDate: 'Dec 12 - 26',
                                      shopId: product['shopid'],
                                      delivary: product['delivary'],
                                    ),
                                  ),
                                );
                              },
                              child: ProductCard(product: product),
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        ])));
  }
}
