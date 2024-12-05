import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:motolk/Pages/Shop_Details.dart';

import '../Pages/Shop_Items.dart';

class ShopPage extends StatefulWidget {
  final String shopId;
  final String backgroundImage;
  final String title;
  final double rating;
  final String mobileNumber;
  final String email;
  final String googleMapLocation;

  const ShopPage({
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
  ShopPageState createState() => ShopPageState();
}

class ShopPageState extends State<ShopPage> {
  int currentIndex = 0;

  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    // Initialize screens list after accessing widget properties
    screens = [
      ShopDetailsScreen(
        shopId: widget.shopId,
        backgroundImage: widget.backgroundImage,
        title: widget.title,
        rating: widget.rating,
        mobileNumber: widget.mobileNumber,
        email: widget.email,
        googleMapLocation: widget.googleMapLocation,
      ),
      ShopItemsScreen(
        shopId: widget.shopId,
        backgroundImage: widget.backgroundImage,
        title: widget.title,
        rating: widget.rating,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
        height: size.width * .140,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Container(
              color: Colors.white.withOpacity(0.1),
              child: ListView.builder(
                itemCount: listOfIcons.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: size.width * .024),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        margin: EdgeInsets.only(
                          bottom: index == currentIndex ? 0 : size.width * .029,
                          right: size.width * .0422,
                          left: size.width * .0422,
                        ),
                        width: size.width * .128,
                        height: index == currentIndex ? size.width * .014 : 0,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF09416E), Color(0xFF0B81C6)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10),
                          ),
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Color(0xFF09416E), Color(0xFF0B81C6)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: Icon(
                          listOfIcons[index],
                          size: size.width * .076,
                          color: index == currentIndex
                              ? Colors.white
                              : Colors.black38,
                        ),
                      ),
                      SizedBox(height: size.width * .03),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    //Icons.home_rounded,
    Icons.store_mall_directory_rounded,
    Icons.list_alt_outlined,
    // Icons.shopping_cart_checkout_rounded,
    // Icons.person_rounded,
  ];
}
