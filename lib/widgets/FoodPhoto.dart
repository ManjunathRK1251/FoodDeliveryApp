import 'package:flutter/material.dart';

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
    return Container(
      width: 400,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
        image: DecorationImage(
            image: AssetImage(widget.foodphoto), fit: BoxFit.fill),
      ),
      //child: Image.asset('assets/icons/burger3.jpg'),
    );
  }
}
