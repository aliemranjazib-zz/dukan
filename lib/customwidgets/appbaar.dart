import 'package:dukaan/customwidgets/AppSignIn.dart';
import 'package:dukaan/screens/CartPage.dart';
import 'package:dukaan/screens/userinfo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

Widget appBarWidget(context) {
  return AppBar(
    elevation: 0.0,
    centerTitle: true,
    title: Image.asset(
      "assets/images/ic_app_icon.png",
      width: 80,
      height: 40,
    ),
  );
}
