import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(

            children: [
              SizedBox(height: 20,),
              Center(
                child: Text('Messages',
                style: TextStyle(
                  fontSize: 25,
                ),
                ),
              ),
          SizedBox(height: 30,),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.symmetric(horizontal: 1),
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(8), // Rounded corners
              border: Border.all(color: Colors.grey), // Border color
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: '  Search',
                border: InputBorder.none,
              ),
            ),
          ),
              Expanded(
                  child: Center(
                    child:(
                        Text('No Messages yet')
                    ),
              ),
              )
            ]
          ),
        )
    );

}
}