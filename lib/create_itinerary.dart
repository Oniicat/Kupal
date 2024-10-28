import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lakbay_rizal/navbar.dart';

class CreateItinerary extends StatefulWidget{
  @override
  _CreateItineraryState createState() => _CreateItineraryState();
}

class _CreateItineraryState extends State<CreateItinerary>{
  final List<String> cityNames = ['Angono', 'Antipolo', 'Binangonan', 'Tanay'];
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: 50,
              child: Image.asset(
                'assets/LOGO.png'
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('Select Municipality'),
            ),
            SizedBox(height: 20,),
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6, // Adjust the width as needed
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.1, // Adjust this value to make buttons more compact
                ),

                physics: NeverScrollableScrollPhysics(), // Disable scrolling if inside a scrollable parent
                itemCount: cityNames.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {

                    },
                    child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child:  Text(
                            cityNames[index],
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        )
                    ),
                  );
                },
              ),
            )
        )
          ],
        ),
      ),
    );
  }
}

class CityButtons extends StatefulWidget {
  @override
  _CityButtonsState createState() => _CityButtonsState();
}

class _CityButtonsState extends State<CityButtons> {
  final List<String> cityNames = [
    'Angono',
    'Antipolo',
    'Baras',
    'Binangonan',
    'Cainta',
    'Cardona',
    'Jala-Jala',
    'Morong',
    'Montalban',
    'Pililla',
    'San Mateo',
    'Tanay',
    'Taytay',
    'Teresa'
  ];
  Set<int> selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.close, size: 30),
                      color: Color(0xFFA52424),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [

                  Container(
                    width: 100,
                    child: Image.asset('assets/LOGO.png'),
                  ),
                  SizedBox(height: 40),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      'Select Municipality',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFF7F5EA),
                      border: Border.all(// Border color
                        width: 2, // Border width
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.5,

                    child: AspectRatio(
                      aspectRatio: 0.8,
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                        ),
                        child: Scrollbar(
                          thickness: 8.0,
                          radius: Radius.circular(40),
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 10,
                              childAspectRatio: 2.4,
                            ),
                            itemCount: cityNames.length,
                            itemBuilder: (context, index) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedIndices.contains(index)
                                      ? Color(0xFFA52424)
                                      : Color(0xFFF7F5EA),
                                  foregroundColor: selectedIndices.contains(index)
                                      ? Colors.white
                                      : Color(0xFFA52424),
                                  elevation: 5,
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                  textStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (selectedIndices.contains(index)) {
                                      selectedIndices.remove(index); // Deselect button
                                    } else {
                                      selectedIndices.add(index); // Select button
                                    }
                                  });
                                },
                                child: Center(

                                    child: Text(
                                      cityNames[index],
                                      style: TextStyle(fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),

                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                    alignment: Alignment.center,
                    child: IconButton(
                      color: Color(0xFFA52424),
                      icon: Icon(Icons.arrow_circle_right, size: 50),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => KindofTrip(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0); // Slide from the right
                              const end = Offset.zero; // End at the center
                              const curve = Curves.easeInOut;
                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}







class KindofTrip extends StatefulWidget {
  @override
  _KindofTripState createState() => _KindofTripState();
}

class _KindofTripState extends State<KindofTrip> {
  final List<String> Kindoftrips = ['Solo', 'Family', 'Couple', 'Friends'];
  String? selectedTrip;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60,),
            SizedBox(height: 60),
            Center(
              child: Container(
                width: 100,
                child: Image.asset(
                  'assets/LOGO.png',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'What kind of trip?',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Shadow color with opacity
                      blurRadius: 10, // Spread of the shadow
                      offset: Offset(0, 5), // Position of the shadow
                    ),
                  ],
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedTrip,
                  decoration: InputDecoration(
                    border: InputBorder.none, // Removes the default border
                    contentPadding: EdgeInsets.symmetric(horizontal: 10), // Optional padding
                  ),
                  items: Kindoftrips.map((trip) {
                    return DropdownMenuItem<String>(
                      value: trip,
                      child: Text(trip),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTrip = value; // Update the selected trip type
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 30),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'No. of travelers',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Padding(
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
                    decoration: InputDecoration(
                      hintText: 'No. of travelers',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    ),
                    onChanged: (String value) {
                      // Handle input
                    },
                  ),
                ),
              ),
            ),
            Spacer(), // Pushes the row of buttons to the bottom
            Padding(
              padding: EdgeInsets.only(bottom: 20), // Adds padding at the bottom
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
                children: [
                  // Left Icon Button
                  IconButton(
                    color: Color(0xFFA52424),
                    icon: Icon(Icons.arrow_circle_left, size: 50),
                    onPressed: () {
                      // Navigate to the previous screen
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 200), // Add spacing between the buttons
                  // Right Icon Button with sliding transition
                  IconButton(
                    color: Color(0xFFA52424),
                    icon: Icon(Icons.arrow_circle_right, size: 50),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => Interests(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0); // Slide from right
                            const end = Offset.zero; // End at center
                            const curve = Curves.easeInOut;

                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Interests extends StatefulWidget {
  @override
  _InterestsState createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  final List<String> interestsNames = [
    'Hiking',
    'Park',
    'Resort',
    'Museum'

  ];
  Set<int> selectedIndices = {};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
           children: [
             SizedBox(height: 60,),
             SingleChildScrollView(
               child: Column(
                 children: [
                   SizedBox(height: 60),
                   Container(
                     width: 100,
                     child: Image.asset('assets/LOGO.png'),
                   ),
                   SizedBox(height: 40),
                   Container(
                     alignment: Alignment.centerLeft,
                     margin: EdgeInsets.only(left: 25),
                     child: Text(
                       'Interests',
                       style: TextStyle(fontSize: 20),
                     ),
                   ),
                   SizedBox(height: 20),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Color(0xFFF7F5EA),
                       border: Border.all(// Border color
                         width: 2, // Border width
                       ),
                     ),
                     alignment: Alignment.center,
                     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                     width: MediaQuery.of(context).size.width * 0.8,
                     height: MediaQuery.of(context).size.height * 0.5,

                     child: AspectRatio(
                       aspectRatio: 0.8,
                       child: ScrollConfiguration(
                         behavior: ScrollConfiguration.of(context).copyWith(
                         ),
                         child: Scrollbar(
                           thickness: 8.0,
                           radius: Radius.circular(40),
                           child: GridView.builder(
                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 2,
                               mainAxisSpacing: 15,
                               crossAxisSpacing: 10,
                               childAspectRatio: 3,
                             ),
                             itemCount: interestsNames.length,
                             itemBuilder: (context, index) {
                               return ElevatedButton(
                                 style: ElevatedButton.styleFrom(
                                   backgroundColor: selectedIndices.contains(index)
                                       ? Color(0xFFA52424)
                                       : Color(0xFFF7F5EA),
                                   foregroundColor: selectedIndices.contains(index)
                                       ? Colors.white
                                       : Color(0xFFA52424),
                                   elevation: 5,
                                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                   textStyle: TextStyle(
                                     fontSize: 20,
                                     fontWeight: FontWeight.bold,
                                   ),
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(20),
                                   ),
                                 ),
                                 onPressed: () {
                                   setState(() {
                                     if (selectedIndices.contains(index)) {
                                       selectedIndices.remove(index); // Deselect button
                                     } else {
                                       selectedIndices.add(index); // Select button
                                     }
                                   });
                                 },
                                 child: Center(

                                     child: Text(
                                       interestsNames[index],
                                       style: TextStyle(fontSize: 12),
                                       textAlign: TextAlign.center,
                                     ),

                                 ),
                               );
                             },
                           ),
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
             Spacer(), // Pushes the row of buttons to the bottom
             Padding(
               padding: EdgeInsets.only(bottom: 20), // Adds padding at the bottom
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
                 children: [
                   // Left Icon Button
                   IconButton(
                     color: Color(0xFFA52424),
                     icon: Icon(Icons.arrow_circle_left, size: 50),
                     onPressed: () {
                       // Navigate to the previous screen
                       Navigator.pop(context);
                     },
                   ),
                   SizedBox(width: 200), // Add spacing between the buttons
                   // Right Icon Button with sliding transition
                   IconButton(
                     color: Color(0xFFA52424),
                     icon: Icon(Icons.arrow_circle_right, size: 50),
                     onPressed: () {
                       Navigator.of(context).push(
                         PageRouteBuilder(
                           pageBuilder: (context, animation, secondaryAnimation) => Budget(),
                           transitionsBuilder: (context, animation, secondaryAnimation, child) {
                             const begin = Offset(1.0, 0.0); // Slide from right
                             const end = Offset.zero; // End at center
                             const curve = Curves.easeInOut;

                             var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                             var offsetAnimation = animation.drive(tween);

                             return SlideTransition(
                               position: offsetAnimation,
                               child: child,
                             );
                           },
                         ),
                       );
                     },
                   ),
                 ],
               ),
             ),
           ],

        ),
      ),
    );
  }
}

class Budget extends StatefulWidget {
  @override
  _BudgetState createState() =>  _BudgetState();
}

class _BudgetState extends State<Budget> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 60,),
              Container(
                width: 100,
                child: Image.asset(
                  'assets/LOGO.png',
                ),
              ),

              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 25),
                child:Text(
                  'Budget',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Minimum'),
                  SizedBox(width: 10),  // Add spacing between text and input
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Padding(
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          ),
                          onChanged: (String value) {
                            // Handle input
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Maximum'),
                  SizedBox(width: 10),  // Add spacing between text and input
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Padding(
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          ),
                          onChanged: (String value) {
                            // Handle input
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Number of Days',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFA52424),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('How Many?',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (counter > 0) counter--;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Color(0xFFA52424),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '$counter',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              counter++;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Color(0xFFA52424),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(), // Pushes the row of buttons to the bottom
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      color: Color(0xFFA52424),
                      icon: Icon(Icons.arrow_circle_left, size: 50),
                      onPressed: () {
                        // Navigate to the previous screen
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 200),
                    IconButton(
                      color: Color(0xFFA52424),
                      icon: Icon(Icons.arrow_circle_right, size: 50),
                      onPressed: () {

                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

