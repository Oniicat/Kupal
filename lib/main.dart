import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lakbay_rizal/app_features.dart';
import 'package:lakbay_rizal/create_itinerary.dart';
import 'package:lakbay_rizal/discover_rizal.dart';
import 'package:lakbay_rizal/profile.dart';
import 'package:lakbay_rizal/splash_screen.dart';
import 'package:lakbay_rizal/navbar.dart';
import 'package:lakbay_rizal/themetoggle.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lakbay_rizal/application_theme.dart';
import 'package:lakbay_rizal/carousel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {   //dito sa my app ilalagay kung anong class or screen unang lalabas
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: Welcomewidgets(),
    );
  }
}




class Welcomewidgets extends StatefulWidget {
  @override
  _getstarted createState() => _getstarted();
}

class _getstarted extends State<Welcomewidgets> {
  final PageController _controller = PageController();
  int currentPage = 0; // To track the current page index

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/discover rizal.png',
      'title': 'Discover Rizal',
      'description': 'Discover the beauty and adventure of Rizal Province with our user-friendly platform. From breathtaking landscapes to hidden gems, plan your perfect getaway with ease.'
    },
    {
      'image': 'assets/itinerary genrator.png',
      'title': 'Itinerary Generator',
      'description': 'Easily plan your ideal trip to Rizal, tailored to your preferences and featuring top attractions and experiences!'
    },
    {
      'image': 'assets/tour guide.png',
      'title': 'Tour Guide Booking',
      'description': 'Easily book local tour guides for personalized experiences, offering insights into Rizal’s culture, history, and '
    },
  ];

  @override
  void initState() {
    super.initState();

    // Add listener to track page changes
    _controller.addListener(() {
      int page = _controller.page?.round() ?? 0;
      if (currentPage != page) {
        setState(() {
          currentPage = page;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFAEF),
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image in the center
                  Image.asset(
                    pages[index]['image']!,
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  // Title Text
                  Text(
                    pages[index]['title']!, // Use the 'title' property
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20), // Spacing between title and description
                  // Description Text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      pages[index]['description']!, // Use the 'description' property
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            },
          ),
          // Dot indicator at the bottom
          Positioned(
            bottom: 50,
            child: SmoothPageIndicator(
              controller: _controller,
              count: pages.length,
              effect: WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                spacing: 16,
                activeDotColor: Color(0xFFA52424),
                dotColor: Colors.grey,
              ),
            ),
          ),
          if (currentPage == pages.length - 1)
            Positioned(
              bottom: 100, // Adjust the position of the button
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to HomeScreen when button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: const Text('Get Started'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: Color(0xFFA52424),
                  foregroundColor: Colors.white
                ),
              ),
            ),
        ],
      ),
    );
  }
}



class Login extends StatefulWidget {
  @override
  _Loginstate createState() => _Loginstate();
}
class _Loginstate extends State<Login>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Scaffold(
       backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFDFAEF),
                  borderRadius: BorderRadius.circular(40.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset('assets/LOGO.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      Padding(
                        padding: EdgeInsets.only(left: 22),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 1),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Enter Email',
                              prefixIcon: Icon(Icons.email,
                              color: Color(0xFFA52424),),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            ),
                            onChanged: (String value) {
                              // Handle input
                            },
                            validator: (value) {
                              return value!.isEmpty ? 'Please enter email' : null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                      Padding(
                        padding: EdgeInsets.only(left: 22),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 1),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            obscureText: true, // Hide password input
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              prefixIcon: Icon(Icons.lock,
                              color: Color(0xFFA52424),),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            ),
                            onChanged: (String value) {
                              // Handle input
                            },
                            validator: (value) {
                              return value!.isEmpty ? 'Please enter password' : null;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child:  Spacer(), // No need to specify height, it will expand
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NavBar()),
                            );
                          },

                          child: Text('Login'),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Center(
                        child: Text(
                          'Don’t have an account? Sign in ',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
