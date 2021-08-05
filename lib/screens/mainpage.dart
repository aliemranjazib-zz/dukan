import 'package:dukaan/screens/homepage.dart';
import 'package:dukaan/screens/wishlistscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    Hompage(),
    WishList(),
    WishList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pink, // new
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heart), label: 'Wish List'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.dashcube), label: 'Dashboard'),
        ],
      ),
    );
  }
}
