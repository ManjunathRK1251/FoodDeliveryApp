import 'package:flutter/material.dart';
import 'package:food_delivery_app/size_helpers.dart';

class FoodPhoto extends StatefulWidget {
  const FoodPhoto({
    Key? key,required this.foodphoto,
  }) : super(key: key);

  final foodphoto;
  @override
  State<FoodPhoto> createState() => _FoodPhotoState();
}

class _FoodPhotoState extends State<FoodPhoto> {
  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    return Container(
      width: width * 1.017,
      height: width * 0.763,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(width * 0.0916),
          bottomRight: Radius.circular(width * 0.0916),
        ),
        image: DecorationImage(
            image: AssetImage(widget.foodphoto), fit: BoxFit.fill),
      ),
      //child: Image.asset('assets/icons/burger3.jpg'),
    );
  }
}
