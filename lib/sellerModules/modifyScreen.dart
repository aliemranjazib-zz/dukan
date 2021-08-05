import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:dukaan/models/flutterFire.dart';
import 'package:dukaan/sellerModules/showmodifyData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Showlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var x = 1;
    return Scaffold(
        appBar: appBarWidget(context),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Select Product You want to Edit",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .where('Added By', isEqualTo: user.uid)
                      .snapshots(),
                  builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                    final sc = snapshot.data;
                    if (sc == null)
                      return Center(child: CircularProgressIndicator());
                    else
                      return ListView.builder(
                        itemCount: sc.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.grey,
                              child: (ListTile(
                                title: Text("${sc.docs[index].get("name")}"),
                                trailing: IconButton(
                                    icon: Icon(Icons.update),
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (_) => ModifyDataScreen(
                                              docid: sc.docs[index].id,
                                              name:
                                                  "${sc.docs[index].get("name")}",
                                              price:
                                                  "${sc.docs[index].get("Price")}",
                                              onsale:
                                                  sc.docs[index].get("Onsale"),
                                              populap:
                                                  sc.docs[index].get("Popular"),
                                              catagory:
                                                  "${sc.docs[index].get("Product catagory")}",
                                              wprice:
                                                  "${sc.docs[index].get("WholeSale Price")}",
                                              scode:
                                                  "${sc.docs[index].get("Serial Code")}",
                                              desc:
                                                  "${sc.docs[index].get("description")}",
                                              orginal:
                                                  "${sc.docs[index].get("isOrignal")}",
                                              type:
                                                  "${sc.docs[index].get("product type")}",
                                              prodby:
                                                  "${sc.docs[index].get("Added By")}",
                                              weight:
                                                  "${sc.docs[index].get("weight")}")));

                                      // newScreen(context,
                                      //     "${sc.docs[index].get("name")}");
                                    }),
                              )),
                            ),
                          );
                        },
                      );
                  }),
            ),
          ],
        ));
  }
}
