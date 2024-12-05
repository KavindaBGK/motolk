import 'package:flutter/material.dart';
import 'package:motolk/Providers/Vehicle_Brands.dart';

class MenuItems extends StatelessWidget {
  final List<String> types;
  final String selectedItem;
  final Function(String) onTap;

  const MenuItems({
    required this.types,
    required this.selectedItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: types.map((type) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () => onTap(type),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: selectedItem == type ? Colors.orange : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  if (selectedItem == type)
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.5),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    )
                ],
              ),
              child: Text(
                type,
                style: TextStyle(
                  color: selectedItem == type ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
