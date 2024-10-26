import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lakbay_rizal/main.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is the HomeScreen Screen', style: TextStyle(fontSize: 24)),
      ),
      backgroundColor: Color(0xFF106665)
    );
  }
}
