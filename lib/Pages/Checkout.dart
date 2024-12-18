import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final List<dynamic> cartItems;

  CheckoutPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    // Calculate merchandise subtotal
    double merchandiseSubtotal = cartItems.fold(
        0.0, (sum, item) => sum + (item['price'] * item['quantity']));
    double shippingSubtotal = 360; // Example fixed shipping fee
    double total = merchandiseSubtotal + shippingSubtotal;

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // User Info Section
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'B.G. Keshara Kavinda',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '776405654\nHome: Labeema, Southern',
                style: TextStyle(fontSize: 14),
              ),
              trailing: Icon(Icons.home, color: Colors.orange),
            ),
            Divider(color: Colors.grey), // Divider between sections

            // Cart Items Section
            ...cartItems.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 0.0),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    children: [
                      Image.asset(
                        item['image'],
                        width: 80,
                        height: 80,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          item['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        'Rs. ${item['price']} x ${item['quantity']}',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  trailing: Text(
                    'Rs. ${item['price'] * item['quantity']}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              );
            }).toList(),
            Divider(color: Colors.grey), // Divider after cart items

            // Delivery Options Section
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Row(
                children: [
                  Icon(Icons.delivery_dining,
                      color: Colors.orange), // Delivery Icon
                  SizedBox(width: 8),
                  Text('Standard Delivery',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              subtitle: Text(
                'Guaranteed by 17-21 Dec',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Rs. 360',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Divider(color: Colors.grey), // Divider before totals

            // Subtotal and Total Section
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Merchandise Subtotal',
                  style: TextStyle(fontSize: 16)),
              trailing: Text(
                'Rs. ${merchandiseSubtotal}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title:
                  Text('Shipping Fee Subtotal', style: TextStyle(fontSize: 16)),
              trailing: Text(
                'Rs. ${shippingSubtotal}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Divider(color: Colors.grey), // Divider before total

            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing: Text(
                'Rs. ${total}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
            ),
            // Place Order Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle Order Placement Logic
                },
                child: Text(
                  'Place Order',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
