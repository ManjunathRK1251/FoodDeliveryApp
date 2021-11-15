import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:food_delivery_app/widgets/backarrow.dart';
import 'package:food_delivery_app/widgets/itemCounter.dart';
import 'package:food_delivery_app/widgets/likebutton.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          Stack(
            children: [
              Stack(
                //overlay: visible,
                children: [
                  FoodPhoto(),
                  Positioned(
                    top: 0.0,
                    left: 20,
                    child: BackArrow(),
                  ),
                  Positioned(
                    left: 315,
                    child: LikeButton(),
                  ),
                  //Positioned(bottom: 0.0, left: 110.0, child: ItemCounter()),
                  SizedBox(height: 50),
                  //ItemCounter(),
                ],
              ),
              Positioned(bottom: 0.0, left: 105.0, child: ItemCounter()),
            ],
          ),
        ],
      ),
    );
  }
}

class FoodPhoto extends StatelessWidget {
  const FoodPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          // topLeft: Radius.circular(36),
          // topRight: Radius.circular(36),
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
        image: DecorationImage(
            image: AssetImage('assets/icons/burger3.jpg'), fit: BoxFit.fill),
      ),
      //child: Image.asset('assets/icons/burger3.jpg'),
    );
  }
}
