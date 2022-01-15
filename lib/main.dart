import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/homescreen.dart';
import 'package:food_delivery_app/screens/orderscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //color: Colors.amber,
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        //child: OrderScreen(),
        child: homescreen(),
      ),
    );
  }
}
