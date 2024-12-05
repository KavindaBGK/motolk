import 'package:flutter/material.dart';
import 'package:motolk/Pages/Login.dart';
import 'package:provider/provider.dart';

import '../Providers/Mod_Change.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.black)),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.light_mode, color: Colors.black),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: isLoggedIn
                ? _buildProfileInfo(screenWidth, screenHeight)
                : _buildAuthButtons(screenWidth, screenHeight),
          ),
          Divider(color: Colors.white, thickness: 1),
          // Profile Options
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Account Settings'),
                    _buildProfileOption(
                      icon: Icons.person_outline,
                      title: 'Personal Information',
                      onTap: () {},
                    ),
                    _buildProfileOption(
                      icon: Icons.lock_outline,
                      title: 'Sign-In & Security',
                      onTap: () {},
                    ),
                    Divider(color: Colors.white, thickness: 1),
                    _buildSectionTitle('Shopping'),
                    _buildProfileOption(
                      icon: Icons.history,
                      title: 'Order History',
                      onTap: () {},
                    ),
                    _buildProfileOption(
                      icon: Icons.favorite_outline,
                      title: 'Wishlist',
                      onTap: () {},
                    ),
                    _buildProfileOption(
                      icon: Icons.credit_card,
                      title: 'Payment Methods',
                      onTap: () {},
                    ),
                    _buildProfileOption(
                      icon: Icons.location_on_outlined,
                      title: 'Shipping Address',
                      onTap: () {},
                    ),
                    Divider(color: Colors.white, thickness: 1),
                    _buildSectionTitle('Support'),
                    _buildProfileOption(
                      icon: Icons.help_outline,
                      title: 'Help & Support',
                      onTap: () {},
                    ),
                    _buildProfileOption(
                      icon: Icons.info_outline,
                      title: 'About Us',
                      onTap: () {},
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(double screenWidth, double screenHeight) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/Profile.png'),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Keshara Kavinda',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'bgkkavinda@outlook.com',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAuthButtons(double screenWidth, double screenHeight) {
    return Center(
      child: Column(
        children: [
          Text(
            'Welcome to MotoLK!',
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          SizedBox(
            width: screenWidth * 0.8,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoggedIn = true;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF09416E), Color(0xFF0B81C6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          OutlinedButton(
            onPressed: () {
              setState(() {
                isLoggedIn = true;
              });
            },
            style: OutlinedButton.styleFrom(
              minimumSize: Size(screenWidth * 0.8, 50),
              side: BorderSide(color: Color(0xFF09416E)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text('Sign Up',
                style: TextStyle(fontSize: 16, color: Color(0xFF09416E))),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: TextStyle(fontSize: 16)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
