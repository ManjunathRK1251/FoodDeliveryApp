import 'package:flutter/material.dart';

class FoodPhoto extends StatelessWidget {
  const FoodPhoto({
    Key? key,
  }) : super(key: key);

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
            image: AssetImage('assets/icons/burger3.jpg'), fit: BoxFit.fill),
      ),
      //child: Image.asset('assets/icons/burger3.jpg'),
    );
  }
}
