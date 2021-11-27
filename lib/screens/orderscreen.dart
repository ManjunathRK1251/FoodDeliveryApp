import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:food_delivery_app/globals.dart';
import 'package:food_delivery_app/widgets/FoodPhoto.dart';
import 'package:food_delivery_app/widgets/IngredientsTile.dart';
import 'package:food_delivery_app/widgets/ServiceDetails.dart';
import 'package:food_delivery_app/widgets/about.dart';
import 'package:food_delivery_app/widgets/backarrow.dart';
import 'package:food_delivery_app/widgets/foodtile.dart';
import 'package:food_delivery_app/widgets/itemCounter.dart';
import 'package:food_delivery_app/widgets/likebutton.dart';
import 'package:food_delivery_app/widgets/category.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key, required this.foodname, required this.foodphoto})
      : super(key: key);
  final foodname;
  final foodphoto;
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),
            FoodPhoto(foodphoto:widget.foodphoto),
            Positioned(bottom: 500, left: 105.0, child: ItemCounter()), //380 for pixel 5 500 for note 10 pro max
            Positioned(top: 15.0,left: 315.0, child: LikeButton()),
            Positioned(top: 15.0,left: 20.0, child: BackArrow()),
            Positioned(left: 20.0, top: 360.0, child: FoodName(foodname:widget.foodname)),
            Positioned(left: 20.0, top: 395.0, child: FoodDescription()),
            Positioned(left: 310.0, top: 368.0, child: FoodPrice()),
            Positioned(left: 295.0, top: 385.0, child: DollarSymbol()),
            Positioned(left: 10.0, top: 450.0, child: ServiceDetailsTile()),
            Positioned(left: 20.0, top: 525.0, child: IncredientsText()),
            Positioned(
                left: 20.0,
                top: 555.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    bottom: 20.0,
                  ),
                  child: IngredientsTileList(),
                )),
            Positioned(left: 10.0, bottom: 5.0, child: AddToCart()),
            Positioned(bottom: 100.0,child: About()),
          ],
        ),
      ),
    );
  }
}

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: 374,
            height: 73,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(27),
                topRight: Radius.circular(27),
                bottomLeft: Radius.circular(27),
                bottomRight: Radius.circular(27),
              ),
              color: Color.fromRGBO(255, 104, 57, 1),
            )),
        Positioned(
          left: 85.0,
          top: 20.0,
          child: Obx(() => Text(
                'Add to Cart(\$${count * 7.99})',
                style: GoogleFonts.roboto(
                  fontSize: 25,
                  color: Colors.white,
                ),
              )),
        ),
      ],
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

class FoodName extends StatefulWidget {
  const FoodName({Key? key,required this.foodname}) : super(key: key);
  final foodname;
  @override
  State<FoodName> createState() => _FoodNameState();
}

class _FoodNameState extends State<FoodName> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.foodname,
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
      height: 80.0,
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
