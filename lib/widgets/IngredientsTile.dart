import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientsTile extends StatelessWidget {
  IngredientsTile({Key? key, required this.value}) : super(key: key);

  int value = 1;

  List<String> ingredientsIcon = ['🥩', '🍀', '🫒', '🥚', '🍅'];
  List<String> ingredientsName = [
    'Beef',
    'Lettuce',
    "Olive oil",
    'Egg',
    'Tomato'
  ];

  @override
  Widget build(BuildContext context) {
    return // Figma Flutter Generator Rectangle13Widget - RECTANGLE
        Padding(
      padding: const EdgeInsets.only(right: 15.0, top: 10.0),
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 5.0,
              ),
              Text(ingredientsIcon[value],
                  style: TextStyle(
                    fontSize: 25.0,
                  )),
              SizedBox(
                height: 2.0,
              ),
              Text(ingredientsName[value],
                  style: GoogleFonts.robotoSlab(
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
          width: 66,
          height: 66,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: Color.fromRGBO(244, 242, 242, 1),
          )),
    );
  }
}
