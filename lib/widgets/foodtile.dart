import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FoodTile extends StatefulWidget {
  const FoodTile({Key? key, required this.foodname,required this.foodimage}) : super(key: key);
  final foodname;
  final foodimage;
  @override
  _FoodTileState createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  double elevation = 20.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            elevation: 5.0,
            shadowColor: Colors.black,
            child: Container(
              //child: Image.asset('assets/icons/burger3.jpg', fit: BoxFit.fitWidth),
              width: 366,
              height: 199,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.foodimage),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
                color: Color.fromRGBO(251, 197, 132, 1),
              ),
            ),
          ),
          Positioned(
            bottom: 4.5,
            left: 3.7,
            child: Blur(
              blur: 50.0,
              blurColor: Colors.white10.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: SvgPicture.asset(
                'assets/icons/foodTileInfo.svg',
                color: Colors.white.withOpacity(0.25),
                height: 54.8,
                width: 9.0,
              ),
            ),
          ),
          Positioned(
            bottom: 25.0,
            left: 20.0,
            child: Text(
              widget.foodname,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Calibri',
                  fontSize: 22,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w800,
                  height: 1),
            ),
          ),
          const Positioned(
            bottom: 10.0,
            left: 21.0,
            child: Text(
              'Burgers',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Calibri',
                  fontSize: 15,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
          const Positioned(
            bottom: 6.0,
            left: 73.0,
            child: Text(
              '.',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Calibri',
                  fontSize: 45,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
          const Positioned(
            bottom: 10.0,
            left: 85.0,
            child: Text(
              'Fast Food',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Calibri',
                  fontSize: 15,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
        ],
      ),
    );
  }
}
