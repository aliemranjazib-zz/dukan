import 'package:dukaan/screens/recentproduct.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PopularMenu extends StatelessWidget {
  double width, height = 55.0;
  double customFontSize = 13;
  String defaultFontFamily = 'Roboto-Light.ttf';

  @override
  static const productpage = "/productpage";
  static const popularpage = "/popularpage";
  static const dukaanestore = "/dukaanstore";
  static const flashsell = "/flashsell";
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(popularpage);
                    },
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.account_balance,
                      color: Color(0xFFAB436B),
                    ),
                  ),
                ),
                Text(
                  "Popular",
                  style: TextStyle(
                      color: Color(0xFF969696),
                      fontFamily: 'Roboto-Light.ttf',
                      fontSize: customFontSize),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(flashsell);
                    },
                    shape: CircleBorder(),
                    child: Icon(
                      FontAwesomeIcons.clock,
                      color: Color(0xFFC1A17C),
                    ),
                  ),
                ),
                Text(
                  "Flash Sell",
                  style: TextStyle(
                      color: Color(0xFF969696),
                      fontFamily: defaultFontFamily,
                      fontSize: customFontSize),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(dukaanestore);
                    },
                    shape: CircleBorder(),
                    child: Icon(
                      FontAwesomeIcons.truck,
                      color: Color(0xFF5EB699),
                    ),
                  ),
                ),
                Text(
                  "Dukaan Store",
                  style: TextStyle(
                      color: Color(0xFF969696),
                      fontFamily: defaultFontFamily,
                      fontSize: customFontSize),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                  child: RawMaterialButton(
                    onPressed: () {
                      Get.to(Recentprod());
                    },
                    shape: CircleBorder(),
                    child: Icon(
                      FontAwesomeIcons.gift,
                      color: Color(0xFF4D9DA7),
                    ),
                  ),
                ),
                Text(
                  "Recently Added",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF969696),
                      fontFamily: defaultFontFamily,
                      fontSize: customFontSize),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
