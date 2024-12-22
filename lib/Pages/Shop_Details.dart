import 'package:flutter/material.dart';
import 'package:motolk/Pages/Product_Details.dart';
import 'package:motolk/Providers/Product_Data.dart';
import 'package:provider/provider.dart';

Map<String, dynamic> additionalData = {
  'brands': [
    {'logo': 'assets/images/audi.png'},
    {'logo': 'assets/images/bmw.png'},
    {'logo': 'assets/images/honda.png'},
    {'logo': 'assets/images/nissan.png'},
    {'logo': 'assets/images/toyota.png'},
  ],
};

class ShopDetailsScreen extends StatelessWidget {
  final String shopId;
  final String backgroundImage;
  final String shopdp;
  final String title;
  final double rating;
  final String mobileNumber;
  final String email;
  final String googleMapLocation;

  const ShopDetailsScreen({
    Key? key,
    required this.shopId,
    required this.backgroundImage,
    required this.shopdp,
    required this.title,
    required this.rating,
    required this.mobileNumber,
    required this.email,
    required this.googleMapLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productTypeProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final product = productTypeProvider.products
        .where((product) => product['shopid'] == shopId)
        .toList();

    product.sort((a, b) {
      // Parse the discount strings to numbers and compare
      final discountA =
          double.tryParse(a['discount']?.replaceAll('%', '') ?? '0') ?? 0;
      final discountB =
          double.tryParse(b['discount']?.replaceAll('%', '') ?? '0') ?? 0;
      return discountB.compareTo(discountA);
    });

// Take the top 4 products with the highest discount
    final topDiscountedProducts = product.take(4).toList();
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
                              shopdp,
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
            // Brand Logos Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: additionalData['brands'].map<Widget>((brand) {
                  return Expanded(
                    child: Image.asset(
                      brand['logo'],
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  );
                }).toList(),
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    ' LATEST ADDITIONS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Large Image on the Left
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsPage(
                                      imageUrl: product[0]["imagePath"],
                                      price: product[0]["price"],
                                      discount: product[0]["discount"],
                                      title: product[0]["title"],
                                      additionalImages: [
                                        product[0]['imagePath']
                                      ],
                                      deliveryDate: 'Dec 12 - 26',
                                      shopId: product[0]['shopid'],
                                      delivary: product[0]['delivary'],
                                      description: product[0]['description'],
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          product[0]['imagePath'],
                                          height: 200,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product[0]['title'],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Rs.${product[0]['price']}',
                                              style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            const Text(
                                              'Best Price',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(width: 2),
                        // Smaller Items on the Right
                        Expanded(
                          flex: 1, // Occupy less space for smaller items
                          child: Column(
                            children: List.generate(3, (index) {
                              final item = product[index + 1];
                              return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailsPage(
                                            imageUrl: item["imagePath"],
                                            price: item["price"],
                                            discount: item["discount"],
                                            title: item["title"],
                                            additionalImages: [
                                              item['imagePath']
                                            ],
                                            deliveryDate: 'Dec 12 - 26',
                                            shopId: item['shopid'],
                                            delivary: item['delivary'],
                                            description: item['description'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 500,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 3),
                                          Image.asset(
                                            item['imagePath'],
                                            height: 60,
                                            width: 60,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  item['title'],
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  'Rs.${item['price']}',
                                                  style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const Text(
                                                  'Best Price',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            }),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hot deals',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two items per row
                      mainAxisSpacing: 3, // Vertical spacing
                      crossAxisSpacing: 3, // Horizontal spacing
                      childAspectRatio: 4 / 2, // Adjust item size
                    ),
                    itemCount: topDiscountedProducts.length,
                    itemBuilder: (context, index) {
                      final item = topDiscountedProducts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                imageUrl: item["imagePath"],
                                price: item["price"],
                                discount: item["discount"],
                                title: item["title"],
                                additionalImages: [item['imagePath']],
                                deliveryDate: 'Dec 12 - 26',
                                shopId: item['shopid'],
                                delivary: item['delivary'],
                                description: item['description'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  item['imagePath'],
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item['title'],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Rs.${item['price']}',
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const Text(
                                        'Voucher used',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Latest Additions Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                ' Just For You',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: product.map<Widget>((item) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            imageUrl: item["imagePath"],
                            price: item["price"],
                            discount: item["discount"],
                            title: item["title"],
                            additionalImages: [item['imagePath']],
                            deliveryDate: 'Dec 12 - 26',
                            shopId: item['shopid'],
                            delivary: item['delivary'],
                            description: item['description'],
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Image.asset(
                        item['imagePath'],
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item['title']),
                      subtitle: Text(
                        'Rs.${item['price']}\nVoucher used',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          // Handle add to cart action
                          print('Add to cart: ${item['title']}');
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
