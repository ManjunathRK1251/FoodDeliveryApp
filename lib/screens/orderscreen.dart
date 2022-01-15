import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:food_delivery_app/globals.dart';
import 'package:food_delivery_app/size_helpers.dart';
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
    final width = getWidth(context);
    final height = getHeight(context);
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
            Positioned(bottom: width * 1.27, left: height * 0.12, child: ItemCounter()), //380 for pixel 5 500 for note 10 pro max
            Positioned(top: width * 0.038,left: width * 0.80, child: LikeButton()),
            Positioned(top: width * 0.038,left: width * 0.051, child: BackArrow()),
            Positioned(left: width * 0.051, top: width * 0.916, child: FoodName(foodname:widget.foodname)),
            Positioned(left: width * 0.051, top: width * 1.005, child: FoodDescription()),
            Positioned(left: width * 0.788, top: width * 0.936, child: FoodPrice()),
            Positioned(left: width * 0.75, top: width * 0.979, child: DollarSymbol()),
            Positioned(left: width * 0.025, top: width * 1.145, child: ServiceDetailsTile()),
            Positioned(left: width * 0.051, top: width * 1.335, child: IncredientsText()),
            Positioned(
                left: width * 0.051,
                top: width * 1.412,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: width * 0.020,
                    bottom: width * 0.051,
                  ),
                  child: IngredientsTileList(),
                )),
            Positioned(left: width * 0.025, bottom: width * 0.012, child: AddToCart()),
            Positioned(bottom: width * 0.2544,child: About()),
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
    final width = getWidth(context);
    final height = getHeight(context);
    return Stack(
      children: [
        Container(
            width: width * 0.951,
            height: width * 0.1857,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(width * 0.0687),
                topRight: Radius.circular(width * 0.0687),
                bottomLeft: Radius.circular(width * 0.0687),
                bottomRight: Radius.circular(width * 0.0687),
              ),
              color: Color.fromRGBO(255, 104, 57, 1),
            )),
        Positioned(
          left: width * 0.216,
          top: width * 0.0508,
          child: Obx(() => Text(
                'Add to Cart(\$${count * 7.99})',
                style: GoogleFonts.roboto(
                  fontSize:  width * 0.0636,
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
    final width = getWidth(context);
    return Text("\$",
        style: TextStyle(
          fontSize: width * 0.0508,
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
    final width = getWidth(context);
    return Text(
      widget.foodname,
      textAlign: TextAlign.left,
      style: GoogleFonts.robotoSlab(
        fontSize: width * 0.076,
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
    final width = getWidth(context);
    return Text(
      'Beef patty and special sauce               ',
      textAlign: TextAlign.left,
      style: GoogleFonts.robotoSlab(
        fontSize: width * 0.043,
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
    final width = getWidth(context);
    return Text(
      '7.99',
      textAlign: TextAlign.left,
      style: GoogleFonts.roboto(
        fontSize: width * 0.0916,
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
    final width = getWidth(context);
    return Text(
      'Ingredients',
      textAlign: TextAlign.left,
      style: GoogleFonts.robotoSlab(
        fontWeight: FontWeight.bold,
        fontSize: width * 0.0483,
      ),
    );
  }
}

class IngredientsTileList extends StatelessWidget {
  const IngredientsTileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);  
    return Container(
      width: width * 1.017,
      height: width * 0.203,
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
