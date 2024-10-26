import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lakbay_rizal/main.dart';
import 'dart:async';


class AnimSplash extends StatefulWidget {
  const AnimSplash({super.key});

  @override
  State<AnimSplash> createState() => _AnimSplashState();
}

class _AnimSplashState extends State<AnimSplash> {
  double _turns = 0.0;
  double _lakbayPosition = 300.0; //inital position nung lakbay
  late Timer _timer; // Timer for rotation
  late Timer _lakbayTimer; // Timer for Lakbay animation

  @override
  void initState() {
    super.initState();
    _startRotation();
  }

  void _startRotation() {
    //Timer nung dalwa
    _timer = Timer(Duration(seconds: 3), () {
      setState(() {
        _turns += 1;
      });
    });

    _lakbayTimer = Timer(Duration(seconds: 3), () {
      setState(() {
        _lakbayPosition = 80.0; // final position ng lakbay
      });
    });

    //Move na sa Next screen
    Timer(Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _lakbayTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedRotation(
              turns: _turns,
              duration: Duration(seconds: 3),
              child: Container(
                width: 300,
                height: 250,
                child: Image.asset('assets/wheel.png'),
              ),
            ),
            Container(
              width: 200,
              height: 150,
              child: Image.asset('assets/river.png'),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 3),
              curve: Curves.easeInOut,
              top: _lakbayPosition,
              child: Container(
                width: 200,
                height: 150,
                child: Image.asset('assets/lakbay rizal.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Splashscreen extends StatefulWidget {

  @override
  State<Splashscreen> createState() => _SplashscreenState();

}


class _SplashscreenState extends State<Splashscreen>
with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Welcomewidgets())
      );
    });
  }
  @override
  void dispose() {
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
   overlays: SystemUiOverlay.values);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
        decoration: BoxDecoration(
         color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset('assets/Ellipse 23.png',
          width: 600,
          height: 600,
          ),
          ],
        ),
      ),
    );
  }
}