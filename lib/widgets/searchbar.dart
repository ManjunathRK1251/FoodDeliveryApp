import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            const SizedBox(width: 15.0),
            SvgPicture.asset('assets/icons/search.svg'),
            const SizedBox(
              width: 40.0,
            ),
            const Text(
              'Search your food',
              //textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(229, 229, 229, 1),
                  fontFamily: 'Calibri',
                  fontSize: 22,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
            const SizedBox(
              width: 40.0,
            ),
            SvgPicture.asset('assets/icons/preferences.svg'),
          ],
        ),
        width: 376,
        height: 77,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          color: Color(0xffF3F3F3),
        ));
  }
}
