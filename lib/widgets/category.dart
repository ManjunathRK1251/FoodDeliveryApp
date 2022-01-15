import 'package:flutter/material.dart';
import 'package:food_delivery_app/size_helpers.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatelessWidget {
  late Color color;
  late String text;
  late Color textColor;

  Category({
    Key? key,
    required this.color,
    required this.textColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    return Padding(
      padding: EdgeInsets.only(right: width * 0.025),
      child: Container(
        child: Align(
            child: Text(
              text,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            alignment: Alignment.center),
        width: width * 0.267,
        height: width * 0.1399,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(width * 0.0381),
            topRight: Radius.circular(width * 0.0381),
            bottomLeft: Radius.circular(width * 0.0381),
            bottomRight: Radius.circular(width * 0.0381),
          ),
          color: color,
        ),
      ),
    );
  }
}
