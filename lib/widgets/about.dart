import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // Figma Flutter Generator AboutWidget - TEXT
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
      'About',
      style: GoogleFonts.robotoSlab(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  height: 1),
    ),
              ),
    SizedBox(height: 5,),
    Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
      child: Text(
        'If you are a fan of Indian food, you must have come\nacross the hugely popular masala dosa and also a \nBurger lover then this is for you',
         style: GoogleFonts.robotoSlab(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  height: 1),
      ),
    ),      
    ],
          ),
        );
  }
}
