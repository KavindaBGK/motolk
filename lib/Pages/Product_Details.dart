import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:motolk/Providers/Reviews.dart';
import 'package:motolk/Providers/Shops_Data_Provider.dart';
import 'package:provider/provider.dart';

import '../Components/Product_Card.dart';
import '../Providers/Cart_Provider.dart';
import '../Providers/Product_Data.dart'; // Add intl package for date formatting

// final List<Map<String, dynamic>> reviews = [
//   {
//     "rating": 5,
//     "review":
//         "Super recommend the purchase, low-cost smartwatch that delivers a lot, great build quality.",
//     "author": "E***s",
//     "date": "09 Nov 2024"
//   },
//   {
//     "rating": 4,
//     "review":
//         "Amazing, it has what it promises, it delivers, it's comfortable, very good material.",
//     "author": "Z***s",
//     "date": "09 Nov 2024"
//   },
//   {
//     "rating": 4,
//     "review":
//         "Amazing, it has what it promises, it delivers, it's comfortable, very good material.",
//     "author": "Z***s",
//     "date": "09 Nov 2024"
//   },
//   {
//     "rating": 4,
//     "review":
//         "Amazing, it has what it promises, it delivers, it's comfortable, very good material.",
//     "author": "Z***s",
//     "date": "09 Nov 2024"
//   }
// ];
final Map<String, dynamic> productData = {
  "description":
      "This is a high-quality product with excellent features. It is durable, reliable, and perfect for everyday use.",
  "images": [
    "assets/images/engin.jpg", // Replace with actual image URLs
    "assets/images/Clutch.jpg"
  ]
};

final storeDatan = {
  "name": "PENGAGAR Smart Watch Store",
  "badge": "Choice",
  "soldByStore": "10,000+",
  "regularBuyers": "500+",
};
late double averageRating;
late String shop;

class ProductDetailsPage extends StatefulWidget {
  final String? imageUrl;
  final String price;
  final String? discount;
  final String? title;
  final List<String> additionalImages;
  final String deliveryDate;
  final String shopId;
  final String delivary;

  const ProductDetailsPage({
    Key? key,
    required this.imageUrl,
    required this.price,
    required this.discount,
    required this.title,
    required this.additionalImages,
    required this.deliveryDate,
    required this.shopId,
    required this.delivary,
  }) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int currentIndex = 0;
  bool showAllReviews = false;
  String selectedMethod = "Card Payment";
  double calculateAverageRating(List<Map<String, dynamic>> reviews) {
    if (reviews.isEmpty) return 0.0;
    final totalRating =
        reviews.fold(0.0, (sum, review) => sum + (review['rating'] ?? 0.0));
    return totalRating / reviews.length;
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts =
        Provider.of<ProductProvider>(context, listen: false).filteredProducts;
    final reviews = Provider.of<ReviewsDataProvider>(context, listen: false)
        .reviews
        .where((reviews) => reviews['shopId'] == widget.shopId)
        .toList();
    shop = widget.shopId;
    final reviewsToShow = showAllReviews ? reviews : reviews.take(2).toList();
    averageRating = calculateAverageRating(reviews);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Details"),
        ),
        body: Stack(children: [
          // Scrollable content
          SingleChildScrollView(
            padding:
                const EdgeInsets.only(bottom: 80), // Space for sticky buttons
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product image carousel
                Container(
                  height: 430,
                  child: PageView.builder(
                    itemCount: widget.additionalImages.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            widget.additionalImages[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Dots indicator
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: DotsIndicator(
                      dotsCount: widget.additionalImages.length,
                      position: currentIndex,
                      decorator: DotsDecorator(
                        activeColor: Colors.orange,
                        size: const Size.square(8.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),

                // Product details
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Section
                      Text(
                        widget.title ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8.0),

                      // Price and Discount Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Price
                          Row(
                            children: [
                              Text(
                                "LKR ${widget.price}",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Text(
                                  "Special Price",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Discount
                          Row(
                            children: [
                              const Icon(Icons.local_offer,
                                  size: 20, color: Colors.red),
                              const SizedBox(width: 4.0),
                              Text(
                                "Save LKR ${widget.discount}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Additional images
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, bottom: 8.0, left: 8, right: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: widget.additionalImages
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

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Select Payment Method",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (widget.delivary == 'available') ...[
                        // Card Payment Option
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedMethod = "Card Payment";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                            decoration: BoxDecoration(
                              color: selectedMethod == "Card Payment"
                                  ? Colors.orange.withOpacity(0.1)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: selectedMethod == "Card Payment"
                                    ? Colors.orange
                                    : Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.credit_card,
                                  color: selectedMethod == "Card Payment"
                                      ? Colors.orange
                                      : Colors.grey,
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "Card Payment",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Cash on Delivery Option
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedMethod = "Cash on Delivery";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                            decoration: BoxDecoration(
                              color: selectedMethod == "Cash on Delivery"
                                  ? Colors.orange.withOpacity(0.1)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: selectedMethod == "Cash on Delivery"
                                    ? Colors.orange
                                    : Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_shipping,
                                  color: selectedMethod == "Cash on Delivery"
                                      ? Colors.orange
                                      : Colors.grey,
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "Cash on Delivery",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ] else ...[
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Delivery not available in your area.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                // Delivery date
                if (widget.delivary == 'available') ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.local_shipping,
                            color: Colors.orange), // Delivery icon
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Estimated Delivery",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "${DateFormat('MMM d').format(DateTime.now())} - ${DateFormat('MMM d').format(DateTime.now().add(Duration(days: 5)))}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(
                  height: 15,
                ),
                // Reviews and ratings
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Reviews",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.verified,
                                    size: 16, color: Colors.green),
                                SizedBox(width: 4),
                                Text(
                                  "All from verified purchases",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            averageRating.toStringAsFixed(1),
                            style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RatingBarIndicator(
                                rating: averageRating,
                                itemCount: 5,
                                itemSize: 18,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${reviews.length} ratings",
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),

                // Reviews List
                ListView.builder(
                  itemCount: reviewsToShow.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final review = reviewsToShow[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            child:
                                const Icon(Icons.person, color: Colors.white),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating:
                                          review['rating']?.toDouble() ?? 0.0,
                                      itemCount: 5,
                                      itemSize: 16,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      review['date'] ?? '',
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  review['review'] ?? '',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  review['author'] ?? '',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                if (!showAllReviews && reviews.length > 2)
                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showAllReviews = true;
                        });
                      },
                      child: const Text("See All"),
                    ),
                  ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Description Section
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        productData["description"],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          height: 1.5, // Line height for better readability
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Images Section
                      const Text(
                        "Images",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          productData["images"].length,
                          (index) => Container(
                            width: 120,
                            height: 120,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                productData["images"][index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                StoreInfoComponent(storeData: storeDatan),
                SizedBox(
                  height: 500,
                  child: Expanded(
                      child: GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two items per row
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.9, // Adjust for item height
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return ProductCard(
                          product: product); // No Expanded widget needed here
                    },
                  )),
                )
              ],
            ),
          ),
          // Sticky buttons
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 35.0),
                child: Row(
                  children: [
                    // "Buy Now" button
                    if (widget.delivary == 'available') ...[
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white, // Text color
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Buy Now action
                          },
                          child: const Text(
                            "Buy Now",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ] else ...[
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white, // Text color
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16)),
                              ),
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Seller Contact",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          const Icon(Icons.phone,
                                              color: Colors.orange),
                                          const SizedBox(width: 12),
                                          const Text(
                                            "+1 123 456 7890", // Replace with dynamic seller contact number
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.orange,
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(
                                              context); // Close the bottom sheet
                                        },
                                        child: const Text("Close"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: const Text(
                            "Contact Seller",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(width: 16),
                    // "Add to Cart" button
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.orange, width: 1.5),
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart(
                            storeName: "New store",
                            title: widget.title,
                            price: double.parse(widget.price),
                            oldPrice: double.parse(widget.price) + 1000,
                            quantity: 1,
                            image: widget.imageUrl,
                          );
                        },
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ]));
  }
}

class StoreInfoComponent extends StatelessWidget {
  final Map<String, dynamic> storeData;

  StoreInfoComponent({required this.storeData});

  @override
  Widget build(BuildContext context) {
    final parsedData = Provider.of<ShopsDataProvider>(context, listen: false)
        .products
        .where((products) => products['shopId'] == shop)
        .toList();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Store name and badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.pink.shade100,
                    radius: 16,
                    child:
                        const Icon(Icons.store, color: Colors.pink, size: 20),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    parsedData[0]['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  storeData["badge"],
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Statistics Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatisticItem(
                value: (averageRating / 5 * 100).toString(),
                label: "positive reviews",
              ),
              _buildStatisticItem(
                value: storeData["soldByStore"],
                label: "sold by store",
              ),
              _buildStatisticItem(
                value: storeData["regularBuyers"],
                label: "regular buyers",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticItem({required String value, required String label}) {
    return Column(
      children: [
        Text(
          '${value}%',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
