import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lakbay_rizal/carousel.dart';
import 'package:lakbay_rizal/create_itinerary.dart';
import 'package:lakbay_rizal/main.dart';
import 'package:lakbay_rizal/homescreen.dart';
import 'package:lakbay_rizal/message.dart';
import 'package:lakbay_rizal/profile.dart';
import 'package:lakbay_rizal/app_features.dart';
class NavBar extends StatefulWidget {


  @override
  State<NavBar> createState() => _NavbarState();
}

class _NavbarState extends State<NavBar> {
  int _currentIndex = 0;
  final List<Widget> screens =  [
    slider(),
    AppFeatures(),
    CityButtonsRow(),
    Messages(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Home', // Added label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu', // Added label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add', // Added label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages', // Added label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile', // Added label
          ),
        ],
        selectedItemColor: Color(0xFFA52424), // Customize as needed
        unselectedItemColor: Colors.grey, // Customize as needed
      ),

    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu Screen')),
      body: Center(
        child: Text('This is the Menu Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Screen')),
      body: Center(
        child: Text('This is the Add Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages Screen')),
      body: Center(
        child: Text('This is the Messages Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
