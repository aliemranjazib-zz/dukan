import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/models/flutterFire.dart';

class Sellershoworder extends StatefulWidget {
  @override
  _SellershoworderState createState() => _SellershoworderState();
}

class _SellershoworderState extends State<Sellershoworder> {
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
                List pro = mydata[i]['Prodname'];

                return ListTile(
                  leading: CircleAvatar(),
                  title: Text("${mydata[i]['Prodname']}\n"),
                  subtitle: Text("${mydata[i].get("Total Price")}\n"),
                  trailing: Text("${mydata[i].get("Order Status")}\n"),
                );
              },
            );
          }),
    );
  }
}
