import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class CityButtonsRow extends StatefulWidget {
  @override
  _CityButtonsRowState createState() => _CityButtonsRowState();
}

class _CityButtonsRowState extends State<CityButtonsRow> {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
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
                  child: Text('Select Municipality'),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: AspectRatio(
                    aspectRatio: 0.4, // Controls overall height of the grid area
                    child: Scrollbar(
                      thickness: 8.0, // Thickness of the scrollbar
                      radius: Radius.circular(10), // Rounded corners
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 10,
                          childAspectRatio: 2.1, // Adjust to make buttons more compact
                        ),
                        itemCount: cityNames.length,
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  cityNames[index],
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Center( // Wrap the Row in a Center widget
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the Row's contents
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Icon(Icons.arrow_circle_left), // Use an icon as the button content
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Icon(Icons.arrow_circle_right), // Use an icon as the button content
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )

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
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.6,
                child: DropdownButtonFormField<String>(
                  value: selectedTrip,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
            SizedBox(height: 30),
            // Center the row of buttons
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the buttons in the row
                children: [
                  // Left Icon Button
                  IconButton(
                    icon: Icon(Icons.arrow_circle_left, size: 30),
                    onPressed: () {
                      // Navigate to the previous screen
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 20), // Add spacing between the buttons
                  IconButton(
                    icon: Icon(Icons.arrow_circle_right, size: 30),
                    onPressed: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Interests()), // Make sure to define Interests class
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: SingleChildScrollView(
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
                    child: Text('Interests'),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: AspectRatio(
                      aspectRatio: 0.5, // Controls overall height of the grid area
                      child: Scrollbar(
                        thickness: 8.0, // Thickness of the scrollbar
                        radius: Radius.circular(10), // Rounded corners
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 10,
                            childAspectRatio: 2.1, // Adjust to make buttons more compact
                          ),
                          itemCount: interestsNames.length,
                          itemBuilder: (context, index) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    interestsNames[index],
                                    style: TextStyle(fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            IconButton(
                              icon: Icon(Icons.arrow_circle_left, size: 30),
                              onPressed: () {

                                Navigator.pop(context);
                              },
                            ),
                            // Right Icon Button
                            IconButton(
                              icon: Icon(Icons.arrow_circle_right, size: 30),
                              onPressed: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Interests()),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )

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
              Container(
                width: 100,
                child: Image.asset(
                  'assets/LOGO.png',
                ),
              ),

              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Text('Budget'),
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
                child: Text('Number of Days'),
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
             SizedBox(height: 60,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        IconButton(
                          icon: Icon(Icons.arrow_circle_left, size: 30),
                          onPressed: () {

                            Navigator.pop(context);
                          },
                        ),
                        // Right Icon Button
                        IconButton(
                          icon: Icon(Icons.arrow_circle_right, size: 30),
                          onPressed: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Interests()),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

