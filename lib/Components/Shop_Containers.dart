import 'package:flutter/material.dart';

class ReusableContainerforshop extends StatelessWidget {
  final Map<String, dynamic> data; // Data for the container

  const ReusableContainerforshop({required this.data, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(data['backgroundImage']),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['title'],
                  style: TextStyle(
                    color: data['titleColor'] ?? Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data['subtitle'],
                  style: TextStyle(
                    color: data['subtitleColor'] ?? Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: data['onButtonPressed'] ?? () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(70, 40),
                  ),
                  child: Text(data['buttonText']),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  data['rating'] != null ? data['rating'].toString() : 'N/A',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
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
