import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Map<String, dynamic> shopData = {
  "shopId": "SHP001",
  "backgroundImage": "assets/images/shop_background.jpg",
  "title": "The Modern Mart",
  "rating": 4.5,
  "mobileNumber": "+1 123 456 7890",
  "email": "info@modernmart.com",
  "googleMapLocation": "https://maps.google.com/?q=37.7749,-122.4194",
  "address": "123 Main Street, San Francisco, CA 94103",
  "vision": "To revolutionize modern retail with cutting-edge technology.",
  "mission":
      "Provide top-quality products at the best prices with exceptional customer service.",
  "services": ["Groceries", "Electronics", "Home Essentials", "Fashion"],
  "reviews": [
    {
      "rating": 5,
      "date": "2024-12-01",
      "review": "Amazing shop! Great prices and customer service.",
      "author": "John Doe"
    },
    {
      "rating": 4,
      "date": "2024-11-25",
      "review": "Good variety of products but a bit crowded.",
      "author": "Jane Smith"
    },
    {
      "rating": 5,
      "date": "2024-11-20",
      "review": "Absolutely love this place! Highly recommend.",
      "author": "Alice Johnson"
    }
  ]
};

class ShopContactScreen extends StatelessWidget {
  final String shopId;
  final String backgroundImage;
  final String title;
  final double rating;
  final String mobileNumber;
  final String email;
  final String googleMapLocation;

  const ShopContactScreen({
    Key? key,
    required this.shopId,
    required this.backgroundImage,
    required this.title,
    required this.rating,
    required this.mobileNumber,
    required this.email,
    required this.googleMapLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reviews = shopData['reviews'] ?? [];
    final services = shopData['services'] ?? [];

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/Shop2.jpg",
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
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

            const SizedBox(height: 16),

            // Shop Information Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Information",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(mobileNumber),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.red),
                      const SizedBox(width: 8),
                      Text(email),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          googleMapLocation,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),

                  // Address, Vision, Mission
                  if (shopData['address'] != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("Address: ${shopData['address']}"),
                    ),
                  if (shopData['vision'] != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("Vision: ${shopData['vision']}"),
                    ),
                  if (shopData['mission'] != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("Mission: ${shopData['mission']}"),
                    ),
                  const Divider(),

                  // Services
                  if (services.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Services",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        ...services.map((service) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text("- $service"),
                            )),
                      ],
                    ),
                  const Divider(),

                  // Customer Reviews
                  const Text(
                    "Customer Reviews",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  if (reviews.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...reviews.map((review) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
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
                            )),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
