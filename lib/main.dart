import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blur/blur.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //color: Colors.amber,
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: homescreen(),
      ),
    );
  }
}

// ignore: camel_case_types
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
            child: Container(
                child: // Figma Flutter Generator SearchyourfoodWidget - TEXT
                    Row(
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
                )),
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
              height: 55.0,
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
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 500.0,
              height: 265.0,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const FoodTile();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  late Color color;
  late String text;
  late Color textColor;

  Category({
    Key? key,
    required this.color,
    required this.textColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        child: Align(
            child: Text(
              text,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            alignment: Alignment.center),
        width: 105,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          color: color,
        ),
      ),
    );
  }
}

class FoodTile extends StatefulWidget {
  const FoodTile({Key? key}) : super(key: key);

  @override
  _FoodTileState createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  double elevation = 20.0;
  @override
  Widget build(BuildContext context) {
    return // Figma Flutter Generator Rectangle7Widget - RECTANGLE
        Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            elevation: 5.0,
            shadowColor: Colors.black,
            child: Container(
              //child: Image.asset('assets/icons/burger3.jpg', fit: BoxFit.fitWidth),
              width: 366,
              height: 199,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/burger3.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
                color: Color.fromRGBO(251, 197, 132, 1),
              ),
            ),
          ),
          Positioned(
            bottom: 4.5,
            left: 3.7,
            child: Blur(
              blur: 50.0,
              blurColor: Colors.white10.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: SvgPicture.asset(
                'assets/icons/foodTileInfo.svg',
                color: Colors.white.withOpacity(0.25),
                height: 54.8,
                width: 9.0,
              ),
            ),
          ),
          const Positioned(
            bottom: 25.0,
            left: 20.0,
            child: Text(
              'Chillox Burger',
              textAlign: TextAlign.center,
              style: TextStyle(
                  //color: Color.fromRGBO(0, 0, 0, 1),
                  color: Colors.black,
                  fontFamily: 'Calibri',
                  fontSize: 22,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.w800,
                  height: 1),
            ),
          ),
          // Figma Flutter Generator BurgersWidget - TEXT
          const Positioned(
            bottom: 10.0,
            left: 21.0,
            child: Text(
              'Burgers',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Calibri',
                  fontSize: 15,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
          const Positioned(
            bottom: 6.0,
            left: 73.0,
            child: Text(
              '.',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Calibri',
                  fontSize: 45,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
          const Positioned(
            bottom: 10.0,
            left: 85.0,
            child: Text(
              'Fast Food',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Calibri',
                  fontSize: 15,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
        ],
      ),
    );
  }
}
