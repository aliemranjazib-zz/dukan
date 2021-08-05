import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/models/flutterFire.dart';
import 'package:dukaan/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'CartPage.dart';

class Checkout extends StatefulWidget {
  final int totla;
  Checkout({this.totla});
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  QuerySnapshot querySnapshot;
  User user = FirebaseAuth.instance.currentUser;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  void initState() {
    allvalues();
    alldoc();
    super.initState();
    getDriversList().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
  }

  List<dynamic> title = [];
  List<dynamic> addedby = [];
  List<dynamic> quan = [];

  List<dynamic> docids = [];

  alldoc() {
    db.get().then((value) {
      value.docs.forEach((element) {
        docids.add(element.id);
      });
      print(docids);
    });
  }

  allvalues() {
    db.get().then((value) {
      value.docs.forEach((e) {
        print(e['name']);
        print(e['addedby']);
        // = e['name'];
        title.add(e['name']);
        addedby.add(e['addedby']);
        quan.add(e['quantity']);

        print(quan);
        setState(() {
          querySnapshotfornames = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: Column(
          children: [
            selectedAddressSection(
              querySnapshot.docs[i].get("name"),
              querySnapshot.docs[i].get("Address"),
              querySnapshot.docs[i].get("mail"),
              querySnapshot.docs[i].get("Contact"),
            ),
            allTitle(),
            priceSection(widget.totla),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Colors.redAccent,
                minWidth: double.infinity,
                onPressed: () {
                  showThankYouBottomSheet(context, "aaa");

                  addtoorders(
                    context,
                    title,
                    widget.totla,
                    uid,
                    addedby,
                    quan,
                    querySnapshot.docs[i].get("Address"),
                    querySnapshot.docs[i].get("name"),
                    querySnapshot.docs[i].get("Contact"),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "PLACE ORDER",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showThankYouBottomSheet(BuildContext context, String img) {
    return _scaffoldKey.currentState.showBottomSheet((context) {
      return Container(
        height: 244,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200, width: 2),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        child: Column(
          children: <Widget>[
            // Expanded(
            //   child: Container(
            //     child:
            //         Align(alignment: Alignment.bottomCenter, child: Text(img)),
            //   ),
            //   flex: 2,
            // ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    Text(
                        "\n\nThank you for your purchase. Our company values each and every customer. We strive to provide state-of-the-art devices that respond to our clients’ individual needs. If you have any questions or feedback, please don’t hesitate to reach out."),
                    SizedBox(
                      height: 24,
                    ),
                    RaisedButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('cart')
                            .doc(uid)
                            .collection('cartsdata')
                            .get()
                            .then((value) {
                          for (DocumentSnapshot doc in value.docs) {
                            doc.reference.delete().whenComplete(
                                () => Get.snackbar('', 'order places'));
                          }
                        });
                        Navigator.pop(context);
                        Get.to(Hompage());
                      },
                      padding: EdgeInsets.only(left: 48, right: 48),
                      child: Text(
                        "ok",
                      ),
                      color: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                    )
                  ],
                ),
              ),
              flex: 5,
            )
          ],
        ),
      );
    },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        backgroundColor: Colors.white,
        elevation: 2);
  }

  getDriversList() async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .where('userid', isEqualTo: user.uid)
        .get();
  }

  selectedAddressSection(String n, String a, String m, String c) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    n,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Text(
                      "HOME",
                    ),
                  )
                ],
              ),
              createAddressText(a, 16),
              SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Mobile : $c",
                  ),
                  TextSpan(
                    text: m,
                  ),
                ]),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                color: Colors.grey.shade300,
                height: 1,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  createAddressText(String strAddress, double topMargin) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      child: Text(
        strAddress,
      ),
    );
  }

  QuerySnapshot querySnapshotfornames;

  Widget allTitle() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
        child: ListView(
          children: title
              .map((e) => Card(
                  color: Colors.greenAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(e),
                  )))
              .toList(),
        ),
      ),
    );
  }

  priceSection(int p) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 4,
              ),
              Text(
                "PRICE DETAILS",
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 8,
              ),
              createPriceItem("Total MRP", "$p", Colors.grey.shade700),
              createPriceItem(
                  "Delievery Charges", "FREE", Colors.teal.shade300),
              SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Total",
                  ),
                  Text("$p")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  createPriceItem(String key, String value, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            key,
          ),
          Text(
            value,
          )
        ],
      ),
    );
  }
}
