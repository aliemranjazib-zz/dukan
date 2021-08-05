import 'package:dukaan/screens/CartPage.dart';
import 'package:dukaan/screens/homepage.dart';
import 'package:dukaan/screens/userinfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;

  // final List<Widget> _children = [
  //   Hompage(),
  //   WishList(),
  //   WishList(),
  // ];

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        // _selectedIndex = _selectedIndex + 1;
        _selectedIndex = index;
        if (_selectedIndex == 0) {
          Get.to(Hompage());
          _selectedIndex = 0;
        } else if (_selectedIndex == 1) {
          Get.to(userdatascreen());
          _selectedIndex = 1;
        } else {
          Get.to(CartPage());
          _selectedIndex = 2;
        }
        print(_selectedIndex);
      });
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text(
            'Home',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          title: Text(
            'Account',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.cartPlus),
          title: Text(
            'Cart',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
      ],
      selectedItemColor: Color(0xFFAA292E),
      onTap: _onItemTapped,
    );
  }
}
