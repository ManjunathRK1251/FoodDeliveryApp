import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
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
        width: 105,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          color: color,
        ),
      ),
    );
  }
}
