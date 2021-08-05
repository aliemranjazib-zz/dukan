import 'package:dukaan/customwidgets/AppSignIn.dart';
import 'package:dukaan/customwidgets/GridTilesProducts.dart';
import 'package:dukaan/customwidgets/PopularMenuWidget.dart';
import 'package:dukaan/screens/Productdetailscreen.dart';
import 'package:dukaan/screens/checkoutScreen.dart';
import 'package:dukaan/screens/dukaanstore.dart';
import 'package:dukaan/screens/flashsell.dart';
import 'package:dukaan/screens/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dukaan/screens/papularScreen.dart';
import 'package:dukaan/screens/productpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(450, 800),
      builder: () => GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'Roboto',
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
            backgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: AppSignIn(),
        routes: {
          Hompage.productpage: (context) => ProductScreen(),
          GridTilesProducts.detailpage: (context) => ProductDetail(),
          PopularMenu.popularpage: (context) => PopularScreens(),
          PopularMenu.dukaanestore: (context) => DukaanStoreScreen(),
          PopularMenu.flashsell: (context) => FlashSellScreen(),
          DukaanStoreScreen.detailpage1: (context) => ProductDetail(),
          ProductDetail.checkout: (context) => Checkout(),
        },
      ),
    );
  }
}
