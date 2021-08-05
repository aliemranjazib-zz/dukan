import 'package:dukaan/adminmodule/adminsignin.dart';
import 'package:dukaan/models/flutterFire.dart';
import 'package:dukaan/screens/dukaanstore.dart';
import 'package:dukaan/screens/homepage.dart';
import 'package:dukaan/screens/viewOrder.dart';
import 'package:dukaan/sellerModules/sellersignin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createDrawerHeader(),
            _createDrawerItem(
                icon: Icons.home,
                text: 'Home',
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hompage()),
                    )),
            _createDrawerItem(
                icon: FontAwesomeIcons.store,
                text: 'Dukaan Store',
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DukaanStoreScreen()),
                    )),
            _createDrawerItem(
                icon: FontAwesomeIcons.user,
                text: 'Seller Mode',
                onTap: () {
                  signout();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppSignIn()),
                  );
                }),
            _createDrawerItem(
                icon: FontAwesomeIcons.list,
                text: 'View My Orders',
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => viewOrder()),
                    )),
            _createDrawerItem(
                icon: FontAwesomeIcons.user,
                text: 'Admin Panel',
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => adminsignin()),
                    )),
          ],
        ),
      ),
    );
  }
}

Widget _createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Center(
        child: Image.asset(
          "assets/images/ic_app_icon.png",
          width: 80,
          height: 40,
        ),
      ));
}

Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(
          icon,
          color: Color(0xFF808080),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            text,
            style: TextStyle(color: Color(0xFF484848)),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
