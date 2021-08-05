import 'package:dukaan/adminmodule/userscreen.dart';
import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:dukaan/sellerModules/addcatagory.dart';
import 'package:dukaan/sellerModules/addproduct.dart';
import 'package:dukaan/sellerModules/dellist.dart';
import 'package:dukaan/sellerModules/modifyScreen.dart';
import 'package:dukaan/sellerModules/showorders.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            Card(
                elevation: 1.0,
                margin: new EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
                  child: new InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Userscreen()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        SizedBox(height: 50.0.h),
                        Center(
                            child: Icon(
                          FontAwesomeIcons.user,
                          size: 40.0,
                          color: Colors.black,
                        )),
                        SizedBox(height: 20.0.h),
                        new Center(
                          child: new Text("Users",
                              style: new TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                )),
            Card(
                elevation: 1.0,
                margin: new EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
                  child: new InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddCatagory()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        SizedBox(height: 50.0.h),
                        Center(
                            child: Icon(
                          FontAwesomeIcons.eye,
                          size: 40.0,
                          color: Colors.black,
                        )),
                        SizedBox(height: 20.0.h),
                        new Center(
                          child: new Text("Add Catagory",
                              style: new TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                )),
            Card(
                elevation: 1.0,
                margin: new EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
                  child: new InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => dellist()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        SizedBox(height: 50.0.h),
                        Center(
                            child: Icon(
                          Icons.delete,
                          size: 40.0,
                          color: Colors.black,
                        )),
                        SizedBox(height: 20.0.h),
                        new Center(
                          child: new Text("Delete Product",
                              style: new TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                )),
            Card(
                elevation: 1.0,
                margin: new EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
                  child: new InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Showlist()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        SizedBox(height: 50.0.h),
                        Center(
                            child: Icon(
                          Icons.update,
                          size: 40.0,
                          color: Colors.black,
                        )),
                        SizedBox(height: 20.0.h),
                        new Center(
                          child: new Text("Modify products",
                              style: new TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                )),
            Card(
                elevation: 1.0,
                margin: new EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
                  child: new InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Showlist()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        SizedBox(height: 50.0.h),
                        Center(
                            child: Icon(
                          Icons.update,
                          size: 40.0,
                          color: Colors.black,
                        )),
                        SizedBox(height: 20.0.h),
                        new Center(
                          child: new Text("Change order status",
                              style: new TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                )),
            Card(
                elevation: 1.0,
                margin: new EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
                  child: new InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Sellershoworder()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        SizedBox(height: 50.0.h),
                        Center(
                            child: Icon(
                          Icons.update,
                          size: 40.0,
                          color: Colors.black,
                        )),
                        SizedBox(height: 20.0.h),
                        new Center(
                          child: new Text("Show Orders",
                              style: new TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
