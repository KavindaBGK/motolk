import 'package:flutter/material.dart';
import 'package:motolk/Pages/Profile.dart';
import 'package:provider/provider.dart';
import 'Pages/Home_Page.dart';
import 'Providers/Advertisment_data.dart';
import 'Providers/Catagory_Data.dart';
import 'Providers/Product_Data.dart';
import 'Providers/Vehical_Type.dart';
import 'Providers/Vehicle_Brands.dart';
import 'dart:ui'; // For the BackdropFilter

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Add your providers here
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => VehicalTypeProvider()),
        ChangeNotifierProvider(create: (context) => VehicalBrandProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => AdvertismentDataProvider()),
      ],
      child: MaterialApp(
        title: 'Multi Provider Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentIndex = 0;

  // Screens to navigate
  final List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens, // Keep all screens alive
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 16, left: 20, right: 20),
        height: size.width * .140,
        decoration: BoxDecoration(
          // Transparent outer container with rounded corners
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 100.0, sigmaY: 100.0), // Apply blur effect
            child: Container(
              color: Colors.white.withOpacity(
                  0.01), // Semi-transparent background inside the bottom navigation
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: size.width * .024),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = index; // Switch screen
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 1500),
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
                              : Colors
                                  .black38, // Optional: Adjust icon color based on active state
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
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];
}
