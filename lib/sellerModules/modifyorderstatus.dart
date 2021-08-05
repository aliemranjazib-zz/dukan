import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/models/flutterFire.dart';

class Modifyordrstatus extends StatefulWidget {
  @override
  _ModifyordrstatusState createState() => _ModifyordrstatusState();
}

class _ModifyordrstatusState extends State<Modifyordrstatus> {
  List status = ['confirm', 'ready to ship', 'shipped', 'delivered'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('order')
              .doc(uid)
              .collection('ordersdata')
              //  .where('Prodby', isEqualTo: user.uid)
              .snapshots(),
          builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                    //  backgroundColor: Colors.lightBlueAccent,
                    ),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                    //  backgroundColor: Colors.lightBlueAccent,
                    ),
              );
            }
            return ListView.builder(
              primary: false,
              itemCount: snapshot.data.docs.length,
              padding: EdgeInsets.all(12),
              itemBuilder: (context, i) {
                var mydata = snapshot.data.docs;

                // List pro = mydata[i]['Order Status'];

                return InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    "Change order status  ${mydata[i].get("Order Status")} to"),
                                ElevatedButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection("order")
                                          .doc(uid)
                                          .collection("ordersdata")
                                          .doc(snapshot.data.docs[i].id)
                                          .update({
                                        "Order Status": 'Ready To Ship'
                                      });
                                    },
                                    child: Text("Confirmed")),
                                ElevatedButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection("order")
                                          .doc(uid)
                                          .collection("ordersdata")
                                          .doc(snapshot.data.docs[i].id)
                                          .update({
                                        "Order Status": 'Ready To Ship'
                                      });
                                    },
                                    child: Text("ready to ship")),
                                ElevatedButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection("order")
                                          .doc(uid)
                                          .collection("ordersdata")
                                          .doc(snapshot.data.docs[i].id)
                                          .update({"Order Status": 'Shipped'});
                                    },
                                    child: Text("Shipped")),
                                ElevatedButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection("order")
                                          .doc(uid)
                                          .collection("ordersdata")
                                          .doc(snapshot.data.docs[i].id)
                                          .update(
                                              {"Order Status": 'Dilervered'});
                                    },
                                    child: Text("Dilevered"))
                              ],
                            ),
                            actions: [],
                          );
                        });
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(),
                      title: Text("${mydata[i]['Prodname']}\n"),
                      subtitle: Text("${mydata[i].get("Total Price")}\n"),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
