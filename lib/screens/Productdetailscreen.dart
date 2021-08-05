import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:dukaan/data/productdata.dart';
import 'package:dukaan/models/flutterFire.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetail extends StatefulWidget {
  static const checkout = "/checkuout";

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  newScreen(BuildContext context, String productname, String imageUrl,
      String price, String prodby) {
    Navigator.of(context).pushNamed(ProductDetail.checkout, arguments: {
      "pname": productname,
      "pimage": imageUrl,
      "pprice": price,
      "prodby": prodby,
    });
  }

  int inc = 1;

  var isfvrt = false;
  @override
  void initState() {
    super.initState();
    if (wholeseller.endsWith('R')) {
      inc = 20;
    } else {
      inc = 1;
    }
    getd();
  }

  getd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.get("v");
  }

  String wholeseller = 'WHOLESELLER';

  @override
  Widget build(BuildContext context) {
    final routArg = ModalRoute.of(context).settings.arguments as Map;
    final productname = routArg["pname"];
    final imageUrl = routArg["pimage"];

    final price = routArg["pprice"];

    cal() {}

    final onsale = routArg["ponsale"];
    final populap = routArg["ppopular"];
    final catagory = routArg["pcat"];
    final wprice = routArg["pwprice"];
    final scode = routArg["pscode"];
    final prodby = routArg["prodby"];
    final desc = routArg["pdesc"];
    final orginal = routArg["porignal"];
    final type = routArg["ptype"];
    final weight = routArg["pweight"];
    var x = int.parse(price);
    var w = int.parse(wprice);

    cc(int price) {
      int p = 0;
      p = price * inc;
      return p;
    }

    return Scaffold(
      appBar: appBarWidget(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageUrl, fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              color: Color(0xFFFFFFFF),
              child: Text(productname,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF565656))),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              color: Color(0xFFFFFFFF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("SKU".toUpperCase(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF565656))),
                  Text(scode,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFfd0100))),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF999999),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              color: Color(0xFFFFFFFF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price".toUpperCase(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF565656))),
                  Text("Rs $price ",
                      style: TextStyle(
                          fontFamily: 'Roboto-Light.ttf',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFf67426))),
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              color: Color(0xFFFFFFFF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Wholesale Price".toUpperCase(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF565656))),
                  Text("Rs $wprice ",
                      style: TextStyle(
                          fontFamily: 'Roboto-Light.ttf',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFf67426))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              color: Color(0xFFFFFFFF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Description",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF565656))),
                  SizedBox(
                    height: 15,
                  ),
                  Text(desc,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4c4c4c))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              color: Color(0xFFFFFFFF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Specification",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF565656))),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Product Type",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4c4c4c))),
                              Text(type,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4c4c4c))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Orignal",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4c4c4c))),
                              Text(orginal,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4c4c4c))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Weight",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4c4c4c))),
                              Text("$weight grams",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4c4c4c))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("On Sale",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4c4c4c))),
                              Text(onsale,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4c4c4c))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(isfvrt
                          ? Icons.favorite
                          : Icons.favorite_outline_outlined),
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        if (isfvrt == false) {
                          setState(() {
                            isfvrt = true;
                            prefs.setBool("v", true);
                            print(prefs.setBool("v", true));
                          });

                          print('t');
                        } else {
                          setState(() {
                            isfvrt = false;
                            prefs.remove("v");
                            print('f');
                            print(prefs.remove("v"));
                          });
                        }
                      }),
                  Spacer(),
                  MaterialButton(
                    elevation: 0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        side: BorderSide(color: Color(0xFFfef2f2))),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text("Add To cart"),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      addtocart(
                                        context,
                                        cc(x),
                                        productname,
                                        inc,
                                        prodby,
                                        imageUrl,
                                      );
                                    },
                                    child: Text("add to cart")),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("cancel"))
                              ],
                              content: StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Product name : $productname"),
                                      Text("${cc(w)}"),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("quantity"),
                                          IconButton(
                                              icon:
                                                  Icon(Icons.exposure_minus_1),
                                              onPressed: () {
                                                setState(() {
                                                  if (inc > 20) {
                                                    inc--;
                                                    // ignore: unnecessary_statements

                                                  }
                                                });
                                              }),
                                          Text(
                                            "$inc",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          IconButton(
                                              icon: Icon(Icons.exposure_plus_1),
                                              onPressed: () {
                                                setState(() {
                                                  inc++;
                                                  // ignore: unnecessary_statements
                                                });
                                              })
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          });
                    },
                    color: Color(0xFFfef2f2),
                    textColor: Colors.white,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 5, right: 5, top: 15, bottom: 15),
                      child: Text("$wholeseller",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFff665e))),
                    ),
                  ),
                  MaterialButton(
                    elevation: 0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        side: BorderSide(color: Color(0xFFff665e))),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text("Add To cart"),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      addtocart(
                                        context,
                                        cc(w),
                                        productname,
                                        inc,
                                        prodby,
                                        imageUrl,
                                      );
                                    },
                                    child: Text("add to cart")),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("cancel"))
                              ],
                              content: StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Product name : $productname"),
                                      Text("${cc(x)}"),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("quantity"),
                                          IconButton(
                                              icon:
                                                  Icon(Icons.exposure_minus_1),
                                              onPressed: () {
                                                setState(() {
                                                  if (inc > 1) {
                                                    inc--;
                                                    // ignore: unnecessary_statements

                                                  }
                                                });
                                              }),
                                          Text(
                                            "$inc",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          IconButton(
                                              icon: Icon(Icons.exposure_plus_1),
                                              onPressed: () {
                                                setState(() {
                                                  inc++;
                                                  // ignore: unnecessary_statements
                                                });
                                              })
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          });
                      // newScreen(context, productname, imageUrl, price, prodby);
                    },
                    color: Color(0xFFff665e),
                    textColor: Colors.white,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 5, right: 5, top: 15, bottom: 15),
                      child: Text("Buy Now".toUpperCase(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF))),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
