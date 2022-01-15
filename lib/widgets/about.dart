import 'package:flutter/material.dart';
import 'package:food_delivery_app/size_helpers.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    
    return // Figma Flutter Generator AboutWidget - TEXT
        Padding(
      padding: EdgeInsets.all(width * 0.0203),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getWidth(context) * 0.15,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.0203),
            child: Text(
              'About',
              style: GoogleFonts.robotoSlab(
                  fontSize: width * 0.048, fontWeight: FontWeight.w600, height: 1),
            ),
          ),
          SizedBox(
            height: width * 0.0127,
          ),
          Padding(
            padding:  EdgeInsets.only(left: width * 0.0203, right: width * 0.0203),
            child: Text(
              'If you are a fan of Indian food, you must have come\nacross the hugely popular masala dosa and also a \nBurger lover then this is for you',
              style: GoogleFonts.robotoSlab(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: width * 0.038,
                  fontWeight: FontWeight.w300,
                  height: 1),
            ),
          ),
        ],
      ),
    );
  }
}
