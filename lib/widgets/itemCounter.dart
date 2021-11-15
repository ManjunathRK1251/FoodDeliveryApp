import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                color: Colors.orange,
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
                color: Colors.orange,
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
