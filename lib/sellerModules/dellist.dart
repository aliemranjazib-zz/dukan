import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:dukaan/models/flutterFire.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class dellist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Select Product You want to Delete",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                          child: (ListTile(
                            leading: CircleAvatar(
                              child: Text(" 1"),
                            ),
                            title: Text("${sc.docs[index].get("name")}"),
                            trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                            title: Text("Confirm Delete"),
                                            content: Text(
                                                "Are you sure you want to delete?"),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    FirebaseFirestore.instance
                                                        .collection('products')
                                                        .doc(sc.docs[index].id)
                                                        .delete()
                                                        .whenComplete(() =>
                                                            Navigator.pop(
                                                                context));
                                                  },
                                                  child: Text("yes")),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("No"))
                                            ]);
                                      });
                                }),
                          )),
                        );
                      },
                    );
                }),
          ),
        ],
      ),
    );
  }
}
