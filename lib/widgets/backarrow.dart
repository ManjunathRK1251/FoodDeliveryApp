import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/size_helpers.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).pop(),
      },
      child: Container(
          child: Icon(EvaIcons.arrowBack, size: width * 0.076),
          width: width * 0.137,
          height: width * 0.1399,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(width * 0.0381),
              topRight: Radius.circular(width * 0.0381),
              bottomLeft: Radius.circular(width * 0.0381),
              bottomRight: Radius.circular(width * 0.0381),
            ),
            color: Color.fromRGBO(244, 242, 242, 1),
          )),
    );
  }
}
