import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
              Positioned(bottom: -25.0, left: 105.0, child: ItemCounter()),
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

class LikeButton extends StatelessWidget {
  const LikeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(EvaIcons.heartOutline, size: 30),
      width: 54,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        color: Color.fromRGBO(244, 242, 242, 1),
      ),
    );
  }
}

class BackArrow extends StatelessWidget {
  const BackArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Icon(EvaIcons.arrowBack, size: 30),
        width: 54,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          color: Color.fromRGBO(244, 242, 242, 1),
        ));
  }
}

class ItemCounter extends StatefulWidget {
  const ItemCounter({Key? key}) : super(key: key);

  @override
  _ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Figma Flutter Generator Ellipse1Widget - ELLIPSE

        Container(
          width: 168,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22),
              topRight: Radius.circular(22),
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(255, 139, 4, 0.41999998688697815),
                  offset: Offset(0, 4),
                  blurRadius: 50)
            ],
            color: Color.fromRGBO(243, 238, 238, 1),
          ),
        ),
        Positioned(
          top: 10.0,
          left: 55.0,
          child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 251, 251, 1),
                borderRadius: BorderRadius.all(Radius.elliptical(58, 58)),
              )),
        ),

        Positioned(
          left: 15.0,
          child: GestureDetector(
            onTap: () => setState(() {
              if (count > 0) {
                count--;
              }
            }),
            child: Text(
              '-',
              style: GoogleFonts.robotoSlab(
                fontSize: 60.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        Positioned(
          top: 20.0,
          left: 75.0,
          child: Text(
            '$count',
            style: GoogleFonts.roboto(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          top: 15.0,
          left: 130.0,
          child: GestureDetector(
            onTap: () => setState(() {
              count++;
            }),
            child: Text(
              '+',
              style: GoogleFonts.robotoSlab(
                fontSize: 35.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
