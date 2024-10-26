import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lakbay_rizal/main.dart';
import 'package:lakbay_rizal/themetoggle.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Center(
                      child: ClipOval(
                        child: Transform.scale(
                          scale: 1.3,
                          child: Image.asset(
                            'assets/Rae.jpeg',
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Alice Guo',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7, // Match button width
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'General',
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    buildButton(
                      icon: Icons.baby_changing_station,
                      label: 'Edit Profile',
                      onPressed: () {


                      },
                    ),
                    SizedBox(height: 14),
                    buildButton(
                      icon: Icons.person,
                      label: 'Account Information',
                      onPressed: () {},
                    ),
                    SizedBox(height: 14),
                    buildButton(
                      icon: Icons.feedback,
                      label: 'Feedback',
                      onPressed: () {},
                    ),
                    SizedBox(height: 14),
                    buildButton(
                      icon: Icons.settings,
                      label: 'Settings',
                      onPressed: () {
                        Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                      },
                    ),
                    SizedBox(height: 50),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFFA52424),
                          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Logout'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildButton({required IconData icon, required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Color(0xFFA52424)),
            SizedBox(width: 20),
            Text(
              label,
            //  style: TextStyle(color: Color(0xFF106665)),
            ),
          ],
        ),
        style: TextButton.styleFrom(
          minimumSize: Size(270, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Colors.black, width: 1),
          ),
        ),
      ),
    );
  }
}



void navigateToProfile(BuildContext context) //animation
 {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ProfileScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Start from the right
      const end = Offset.zero; // End at the original position
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  ));
}