import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:food_delivery_app/widgets/FoodPhoto.dart';
import 'package:food_delivery_app/widgets/backarrow.dart';
import 'package:food_delivery_app/widgets/foodtile.dart';
import 'package:food_delivery_app/widgets/itemCounter.dart';
import 'package:food_delivery_app/widgets/likebutton.dart';
import 'package:food_delivery_app/widgets/category.dart';
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
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
          FoodPhoto(),
          Positioned(bottom: 380.0, left: 105.0, child: ItemCounter()),
          Positioned(left: 315.0, child: LikeButton()),
          Positioned(left: 20.0, child: BackArrow()),
          Positioned(left: 20.0, top: 360.0, child: FoodName()),
          Positioned(left: 20.0, top: 395.0, child: FoodDescription()),
          Positioned(left: 310.0, top: 368.0, child: FoodPrice()),
          Positioned(left: 295.0, top: 385.0, child: DollarSymbol()),
          Positioned(left: 10.0, top: 450.0, child: ServiceDetailsTile()),
          Positioned(left: 20.0, top: 525.0, child: IncredientsText()),
          Positioned(
              left: 20.0,
              top: 555.0,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IngredientsTileList(),
              )),
        ],
      ),
    );
  }
}

class ServiceDetailsTile extends StatelessWidget {
  List<String> details = ['Free Delivery', '⏰  10-20 min', '⭐  4.8'];

  ServiceDetailsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 480.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    details[index],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                width: 105,
                height: 55,
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
        },
      ),
    );
  }
}

class DollarSymbol extends StatelessWidget {
  const DollarSymbol({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("\$",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ));
  }
}

class FoodName extends StatelessWidget {
  const FoodName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Beef Burger',
      textAlign: TextAlign.left,
      style: GoogleFonts.robotoSlab(
        fontSize: 30,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class FoodDescription extends StatelessWidget {
  const FoodDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Beef patty and special sauce               ',
      textAlign: TextAlign.left,
      style: GoogleFonts.robotoSlab(
        fontSize: 17,
        color: Color.fromRGBO(209, 209, 209, 1),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class FoodPrice extends StatefulWidget {
  const FoodPrice({Key? key}) : super(key: key);

  @override
  _FoodPriceState createState() => _FoodPriceState();
}

class _FoodPriceState extends State<FoodPrice> {
  @override
  Widget build(BuildContext context) {
    return Text(
      '7.99',
      textAlign: TextAlign.left,
      style: GoogleFonts.roboto(
        fontSize: 36,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class IncredientsText extends StatelessWidget {
  const IncredientsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Ingredients',
      textAlign: TextAlign.left,
      style: GoogleFonts.robotoSlab(
        fontWeight: FontWeight.bold,
        fontSize: 19,
      ),
    );
  }
}

class IngredientsTileList extends StatelessWidget {
  const IngredientsTileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      height: 70.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return IngredientsTile(value: index);
        },
      ),
    );
  }
}

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
      padding: const EdgeInsets.only(right: 15.0),
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
              Text(ingredientsName[value],
                  style: GoogleFonts.robotoSlab(
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
          width: 66,
          height: 56,
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
