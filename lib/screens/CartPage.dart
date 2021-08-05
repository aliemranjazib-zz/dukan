import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/customwidgets/BottomNavBarWidget.dart';
import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:dukaan/models/flutterFire.dart';
import 'package:dukaan/screens/checkout.dart';
import 'package:flutter/material.dart';

import 'checkoutScreen.dart';

CollectionReference db = FirebaseFirestore.instance
    .collection('cart')
    .doc(user.uid)
    .collection('cartsdata');

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int i;
  int v = 0;
  int p = 0;

  sum() async {
    await db.get().then((value) {
      value.docs.forEach((e) {
        print(e['price']);
        p += e['price'];
        print(p);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    sum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(context),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        body: StreamBuilder(
            stream: db.snapshots(),
            builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final mydata = snapshot.data.docs;

              return Builder(
                builder: (context) {
                  return ListView(
                    children: <Widget>[
                      createHeader(),
                      createSubTitle(db.snapshots().length),
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, i) {
                          return Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 16, right: 16, top: 16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: 8, left: 8, top: 8, bottom: 8),
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(14)),
                                          color: Colors.blue.shade200,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${mydata[i].get("image")}"))),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  right: 8, top: 4),
                                              child: Text(
                                                "${mydata[i].get("name")}",
                                                maxLines: 2,
                                                softWrap: true,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "${mydata[i].get("addedby")}",
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                      "RS ${mydata[i].get("price")}"),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: <Widget>[
                                                        Container(
                                                          color: Colors
                                                              .grey.shade200,
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 2,
                                                                  right: 12,
                                                                  left: 12),
                                                          child: Text(
                                                              "${mydata[i].get("quantity")}"),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      flex: 100,
                                    )
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: 10, top: 8),
                                  child: InkWell(
                                    onTap: () {
                                      db.doc(mydata[i].id).delete();
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      color: Colors.green),
                                ),
                              )
                            ],
                          );
                        },
                        itemCount: snapshot.data.docs.length,
                      ),
                      footer(context),
                    ],
                  );
                },
              );
            }),
        bottomNavigationBar: BottomNavBarWidget());
  }

  footer(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Container(
          //       margin: EdgeInsets.only(left: 30),
          //       child: Text(
          //         "Total",
          //       ),
          //     ),
          //     // Container(
          //     //   margin: EdgeInsets.only(right: 30),
          //     //   child: Text(
          //     //     "PKR $p",
          //     //   ),
          //     // ),
          //   ],
          // ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => Checkout(
                        totla: p,
                      )));
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (_) => CheckOutScreen(
              //           total: p,
              //         )));
            },
            color: Colors.green,
            padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Text(
              "Checkout",
            ),
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

  createHeader() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "SHOPPING CART",
      ),
      margin: EdgeInsets.only(left: 12, top: 12),
    );
  }

  createSubTitle(var length) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Total() Items",
      ),
      margin: EdgeInsets.only(left: 12, top: 4),
    );
  }
}
