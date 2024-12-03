import 'package:flutter/material.dart';
import 'package:motolk/Pages/Vehicle_Products_Page.dart';
import 'package:provider/provider.dart';
import '../Components/Home_Container.dart';
import '../Components/Product_Card.dart';
import '../Components/Vehicle_Type_Container.dart';
import '../Components/catagort.dart';
import '../Providers/Advertisment_data.dart';
import '../Providers/Catagory_Data.dart';
import '../Providers/Product_Data.dart';
import '../Providers/Vehical_Type.dart';
import 'Category_Products_Page.dart';
import 'Product_Details.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>().loadInitialProducts();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  Future<void> _loadMoreData() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      await Provider.of<ProductProvider>(context, listen: false)
          .loadMoreProducts();

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          final products = productProvider.filteredProducts;
          final vehicleTypeProvider =
              Provider.of<VehicalTypeProvider>(context, listen: false);
          final vehicles = vehicleTypeProvider.vehicles;
          final categories =
              Provider.of<CategoryProvider>(context, listen: false).categories;
          final parsedData =
              Provider.of<AdvertismentDataProvider>(context, listen: false)
                  .parsedData;

          return Stack(
            children: [
              Container(
                height: 169,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF09416E), Color(0xFF0B81C6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ' Hello Keshara!',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' What do you want to buy?',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white70),
                              ),
                            ],
                          ),
                          IconButton(
                            icon:
                                Icon(Icons.notifications, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      // Search Bar
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 8,
                              spreadRadius: 4,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: 'Search spare parts',
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                          ),
                          onChanged: (query) {
                            productProvider.searchProducts(query);
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableContainer(data: parsedData),
                              const SizedBox(height: 25),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Vehicle Type',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print("See all categories pressed");
                                      },
                                      child: const Text(
                                        'See all',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: vehicles.map((vehicle) {
                                      return VehicleTypeContainer(
                                        backgroundImage:
                                            vehicle["backgroundImage"]!,
                                        title: vehicle["title"]!,
                                        buttonText: "explore more >>",
                                        onButtonPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  VehicleProductsPage(
                                                      category: vehicle[
                                                          "vehicle type"]!),
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Categories',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print("See all categories pressed");
                                      },
                                      child: const Text(
                                        'See all',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: categories.map((category) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: CircularCategory(
                                        imagePath: category["image"]!,
                                        name: category["name"]!,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CategoryProductsPage(
                                                      category:
                                                          category["title"]!),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    double itemWidth =
                                        (constraints.maxWidth - 8) / 2;
                                    return Wrap(
                                      spacing: 8.0,
                                      runSpacing: 8.0,
                                      children: products.map((product) {
                                        return SizedBox(
                                          width: itemWidth,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetailsPage(
                                                    imageUrl:
                                                        product["imagePath"],
                                                    price: product["price"],
                                                    discount:
                                                        product["discount"],
                                                    title: product["title"],
                                                    additionalImages: [
                                                      product['imagePath'],
                                                      product['imagePath']
                                                    ],
                                                    deliveryDate: 'Dec 12 - 26',
                                                  ),
                                                ),
                                              );
                                            },
                                            child: ProductCard(
                                              product: product,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  },
                                ),
                              ),
                              if (_isLoading)
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                ),
                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
