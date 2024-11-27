import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String? imageUrl;
  final String? price;
  final String? discount;
  final String? title;
  final List<String> additionalImages;
  final String deliveryDate;

  const ProductDetailsPage({
    Key? key,
    required this.imageUrl,
    required this.price,
    required this.discount,
    required this.title,
    required this.additionalImages,
    required this.deliveryDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image
                  Image.asset(
                    imageUrl!,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),

                  // Price and discount
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "LKR ${price}",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          "Save LKR ${discount}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      title!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),

                  // Additional images
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: additionalImages
                            .map((image) => Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Image.asset(
                                    image,
                                    width: 100,
                                    height: 100,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),

                  // Delivery date
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Delivery: $deliveryDate",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),

                  // Add more sections here
                ],
              ),
            ),
          ),

          // Fixed Buttons
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Buy Now action
                    },
                    child: Text("Buy Now"),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.orange),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Add to Cart action
                    },
                    child: Text("Add to Cart",
                        style: TextStyle(color: Colors.orange)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
