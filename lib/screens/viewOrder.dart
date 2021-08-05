import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:dukaan/models/flutterFire.dart';
import 'package:flutter/material.dart';

class viewOrder extends StatefulWidget {
  @override
  _viewOrderState createState() => _viewOrderState();
}

class _viewOrderState extends State<viewOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('order')
              .doc(uid)
              .collection('ordersdata')
              .orderBy("DATE", descending: true)
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
                List pro = mydata[i]['Prodname'];

                return ListTile(
                  leading: CircleAvatar(),
                  title: Text("${mydata[i]['Prodname']}\n"),
                  subtitle: Text(" Rs ${mydata[i].get("Total Price")}\n"),
                  trailing: Text("${mydata[i].get("Order Status")}\n"),
                );
              },
            );
          }),
    );
  }
}
