import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/screens/orderscreen.dart';
import 'package:food_delivery_app/size_helpers.dart';
import 'package:food_delivery_app/widgets/category.dart';
import 'package:food_delivery_app/widgets/foodtile.dart';
import 'package:food_delivery_app/widgets/searchbar.dart';
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
  late int tileIndex = 0;
  String? _dropdownvalue = "India";
  List<String> items = ['India', 'China', 'America'];
  List<String> foods = ['🍔 Burger', '🍕 Pizza', '🥗 salad', '🍟 Fries'];

  var food_info = [
    {"name": "Chillox Burger", "image": "assets/images/chillox.jpg"},
    {"name": "McAloo Tikki", "image": "assets/images/McAloo_tikki.jpg"},
    {"name": "McDosa Burger", "image": "assets/images/McDosa_burger.jpg"},
  ];

  void moveToOrderScreen(index) {
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => OrderScreen(
            foodname: food_info[index]["name"],
            foodphoto: food_info[index]["image"],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: SvgPicture.asset('assets/icons/menu.svg',
                      width: width * 0.05, height: width * 0.05),
                ),
                SizedBox(width: width * 0.16),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/location.svg',
                          width:  width * 0.076,
                          height: width * 0.076,
                          alignment: Alignment.topCenter),
                      SizedBox(width: width * 0.025, height: width * 0.025),
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
                Expanded(
                  child: Icon(
                    Icons.notifications_none,
                    size: width * 0.076,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: width * 0.152 ),
          RichText(
            text: TextSpan(
              text: 'What do you want\n        for ',
              style: GoogleFonts.robotoSlab(
                  fontSize: width * 0.063,
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
          SizedBox(height: width * 0.076),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.05,
              right: width * 0.05,
            ),
            child: SearchBar(),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.069, top: width * 0.064),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Categories',
                  //textAlign: TextAlign.right,
                  style: GoogleFonts.robotoSlab(
                    color: Colors.black,
                    fontSize: width * 0.051,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(
              left: width * 0.064,
              top: width * 0.025,
              right: width * 0.064,
            ),
            child: SizedBox(
              width: width * 1.27,
              height: height * 0.069,
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
            padding: EdgeInsets.only(left: width * 0.069, top: width * 0.025),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Popular',
                  //textAlign: TextAlign.right,
                  style: GoogleFonts.robotoSlab(
                    color: Colors.black,
                    fontSize: width * 0.051,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.051, width * 0.025 , width * 0.051, width * 0.051),
            child: SizedBox(
              width: width * 1.27,
              height: height * 0.405, //232 for pixel 5 ,354 for redmi note 10 pro max :")
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: Colors.orange,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    print(index);
                    tileIndex = index;
                    return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          moveToOrderScreen(index);
                        },
                        child: FoodTile(
                          foodname: food_info[index]["name"],
                          foodimage: food_info[index]["image"],
                        ));
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
