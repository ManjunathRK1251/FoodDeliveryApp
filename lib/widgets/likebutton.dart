import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  LikeButton({
    Key? key,
  }) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  Color color = Colors.black;

  IconData heartOutlineIcon = EvaIcons.heartOutline;
  IconData heartIcon = EvaIcons.heart;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 55,
      child: GestureDetector(
          child: Icon(
            isSelected ? heartIcon : heartOutlineIcon,
            color: isSelected ? Colors.red : Colors.black,
            size: isSelected ? 35 : 30,
          ),
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          }),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        color: Color.fromRGBO(244, 242, 242, 1),
      ),
    );
  }
}
