import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DiscoverRizal extends StatefulWidget {
  @override
  _DiscoverRizalState createState() =>  _DiscoverRizalState();
}
class TripItem {
  final String imagePath;
  final String title;

  TripItem(this.imagePath, this.title);//array na magkasama img saka text nung destination
  static final List<TripItem> tripItems = [
    TripItem('assets/hiking.jpg', 'Hiking'),
    TripItem('assets/beach.jpg', 'Beach'),
    TripItem('assets/museum.jpg', 'Museum'),
  ];

}
class  _DiscoverRizalState extends State<DiscoverRizal> {

  @override
  final List<String> Municipality = ['Binangonan', 'Pililla', 'Baras'];
  String? selectedMunicipality;
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row (
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFA52424),
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
                              icon: Icon(Icons.keyboard_arrow_left, size: 30),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child:
                              Text('Categories',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 55,
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
                                child: DropdownButtonFormField<String>(
                                  value: selectedMunicipality,
                                  decoration: InputDecoration(
                                    hintText: 'Municipality',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                  ),
                                  alignment: Alignment.center,
                                  items: Municipality.map((trip) {
                                    return DropdownMenuItem<String>(
                                      value: trip,
                                      child: Align(
                                        child: Text(trip),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedMunicipality = value;
                                    });
                                  },
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: TripItem.tripItems.map((item) {
                    return Container(
                      width: 150,
                      height: 200,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1), // Shadow color
                            spreadRadius: 2, // Spread radius
                            blurRadius: 5, // Blur radius
                            offset: Offset(0, 3), // Changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              item.imagePath,
                              width: 30,
                              height: 10,
                            ),
                          ),

                          SizedBox(height: 20),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.topLeft,
                            child:  Text(

                              item.title,
                              style: TextStyle(fontSize: 14,),
                              textAlign: TextAlign.start,
                            ),
                          )

                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child:
                        Text('Cuisines and Delicacies',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                          ),),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 20),
                          child:
                          InkWell(
                            onTap: () {
                            },
                            child: Text(
                              'See all',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                color: Colors.grey,
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: TripItem.tripItems.map((item) {
                    return Container(
                      width: 150,
                      height: 200,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1), // Shadow color
                            spreadRadius: 2, // Spread radius
                            blurRadius: 5, // Blur radius
                            offset: Offset(0, 3), // Changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              item.imagePath,
                              width: 30,
                              height: 10,
                            ),
                          ),

                          SizedBox(height: 20),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.topLeft,
                            child:  Text(

                              item.title,
                              style: TextStyle(fontSize: 14,),
                              textAlign: TextAlign.start,
                            ),
                          )

                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child:
                        Text('Festivals and Traditions',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                          ),),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 20),
                          child:
                          InkWell(
                            onTap: () {
                            },
                            child: Text(
                              'See all',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                color: Colors.grey,
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: TripItem.tripItems.map((item) {
                    return Container(
                      width: 150,
                      height: 200,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1), // Shadow color
                            spreadRadius: 2, // Spread radius
                            blurRadius: 5, // Blur radius
                            offset: Offset(0, 3), // Changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              item.imagePath,
                              width: 30,
                              height: 10,
                            ),
                          ),

                          SizedBox(height: 20),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.topLeft,
                            child:  Text(

                              item.title,
                              style: TextStyle(fontSize: 14,),
                              textAlign: TextAlign.start,
                            ),
                          )

                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}