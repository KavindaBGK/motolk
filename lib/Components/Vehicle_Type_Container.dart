import 'package:flutter/material.dart';

class VehicleTypeContainer extends StatelessWidget {
  final String backgroundImage;
  final String title;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const VehicleTypeContainer({
    Key? key,
    required this.backgroundImage,
    required this.title,
    required this.buttonText,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Ensure fixed size for the container
      width: MediaQuery.of(context).size.width / 2 - 20, // Half screen width
      height: 100, // Fixed height for the container
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: onButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0), // Reduce padding
                      minimumSize: const Size(50, 30), // Set a minimum size
                      tapTargetSize: MaterialTapTargetSize
                          .shrinkWrap, // Shrink touch target size
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        fontSize: 12, // Reduce text size
                      ),
                    ),
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
