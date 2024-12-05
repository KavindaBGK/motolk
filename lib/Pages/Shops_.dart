import 'package:flutter/material.dart';
import 'package:motolk/Providers/Shops_Data_Provider.dart';
import 'package:provider/provider.dart';
import '../Components/Home_Container.dart';
import '../Components/Shop_Containers.dart';
import '../Providers/Advertisment_data.dart';
import '../Providers/Vehicle_Brands.dart';

class Shops extends StatefulWidget {
  @override
  _ShopsScreenState createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<Shops> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    context.read<ShopsDataProvider>().loadInitialProducts();
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

      await Provider.of<ShopsDataProvider>(context, listen: false)
          .loadMoreProducts();

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String selectedItem = "All";
    final provider = VehicalBrandProvider();
    final types = provider.getTypes() ?? [];
    return Scaffold(
      body: Consumer<ShopsDataProvider>(
        builder: (context, productProvider, child) {
          final products = productProvider.filteredShop;
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
                              const Text(
                                ' Shop Categories',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                child: types.isEmpty
                                    ? Center(
                                        child: Text(
                                            "No vehicle brands available."),
                                      )
                                    : SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: StatefulBuilder(
                                          builder: (BuildContext context,
                                              StateSetter setState) {
                                            return Row(
                                              children: types.map((type) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedItem = type;
                                                        print(
                                                            "Selected Item: $selectedItem");
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 20,
                                                          vertical: 10),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            selectedItem == type
                                                                ? Colors.orange
                                                                : Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        boxShadow: [
                                                          if (selectedItem ==
                                                              type)
                                                            BoxShadow(
                                                              color: Colors
                                                                  .orange
                                                                  .withOpacity(
                                                                      0.5),
                                                              blurRadius: 0,
                                                              offset:
                                                                  Offset(0, 0),
                                                            ),
                                                        ],
                                                      ),
                                                      child: Text(
                                                        type,
                                                        style: TextStyle(
                                                          color: selectedItem ==
                                                                  type
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            );
                                          },
                                        ),
                                      ),
                              ),
                              const SizedBox(height: 25),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    double itemWidth =
                                        (constraints.maxWidth - 8);
                                    return Wrap(
                                      spacing: 8.0,
                                      runSpacing: 12.0,
                                      children: products.map((products) {
                                        return SizedBox(
                                          width: itemWidth,
                                          child: GestureDetector(
                                            onTap: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) =>
                                              //         ProductDetailsPage(
                                              //       imageUrl:
                                              //           product["imagePath"],
                                              //       price: product["price"],
                                              //       discount:
                                              //           product["discount"],
                                              //       title: product["title"],
                                              //       additionalImages: [
                                              //         product['imagePath'],
                                              //         product['imagePath']
                                              //       ],
                                              //       deliveryDate: 'Dec 12 - 26',
                                              //     ),
                                              //   ),
                                              // );
                                            },
                                            child: ReusableContainerforshop(
                                                data: products),
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
