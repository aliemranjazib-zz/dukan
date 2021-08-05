import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String cateogry;

  Detail({this.cateogry});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cateogry),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('products')
            .where('Product catagory', isEqualTo: cateogry)
            .snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
          final mydata = snapshot.data.docs;
          return ListView(
            children: mydata.map((e) => Text(e['name'])).toList(),
          );
        },
      ),
    );
  }
}
