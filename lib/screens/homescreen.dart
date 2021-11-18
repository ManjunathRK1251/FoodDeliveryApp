import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/screens/orderscreen.dart';
import 'package:food_delivery_app/widgets/category.dart';
import 'package:food_delivery_app/widgets/foodtile.dart';
import 'package:google_fonts/google_fonts.dart';

class homescreen extends StatefulWidget {
  const homescreen({
    Key? key,
  }) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

// ignore: camel_case_types
class _homescreenState extends State<homescreen> {
  late int selectedIndex = 0;
  String? _dropdownvalue = "India";
  List<String> items = ['India', 'China', 'America'];
  List<String> foods = ['🍔 Burger', '🍕 Pizza', '🥗 salad', '🍟 Fries'];

  void moveToOrderScreen() {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) {
          return OrderScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: SvgPicture.asset('assets/icons/menu.svg',
                      width: 20, height: 20),
                ),
                const SizedBox(width: 65),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/location.svg',
                          width: 30,
                          height: 30,
                          alignment: Alignment.topCenter),
                      const SizedBox(width: 10, height: 10),
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          alignment: Alignment.bottomLeft,
                          value: _dropdownvalue,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xffC86C00),
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _dropdownvalue = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Icon(
                    Icons.notifications_none,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60.0),
          RichText(
            text: TextSpan(
              text: 'What do you want\n        for ',
              style: GoogleFonts.robotoSlab(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              //style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                    text: 'Dinner',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffC86C00))),
              ],
            ),
          ),
          const SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: SearchBar(),
          ),
          // Figma Flutter Generator CategoriesWidget - TEXT
          Padding(
            padding: const EdgeInsets.only(left: 27.0, top: 25.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Categories',
                  //textAlign: TextAlign.right,
                  style: GoogleFonts.robotoSlab(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              top: 10.0,
              right: 25.0,
            ),
            child: SizedBox(
              width: 500.0,
              height: 60.0,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Category(
                      color: selectedIndex == index
                          ? Colors.orange
                          : const Color(0xffF3F3F3),
                      textColor:
                          selectedIndex == index ? Colors.white : Colors.black,
                      text: foods[index],
                    ),
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27.0, top: 10.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Popular',
                  //textAlign: TextAlign.right,
                  style: GoogleFonts.robotoSlab(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: SizedBox(
              width: 500.0,
              height: 210.0,
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: Colors.orange,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: moveToOrderScreen, child: const FoodTile());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
