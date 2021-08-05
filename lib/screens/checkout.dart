import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:dukaan/screens/CartPage.dart';
import 'package:dukaan/screens/userinfo.dart';
import 'package:flutter/material.dart';

CollectionReference cdb = FirebaseFirestore.instance.collection('Users');

class CheckOutScreen extends StatefulWidget {
  final int total;

  CheckOutScreen({
    this.total,
  });
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  QuerySnapshot querySnapshot;
  QuerySnapshot querySnapshotfornames;

  @override
  void initState() {
    super.initState();
    query();
    allvalues();
  }

  query() async {
    await getDriversList().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
  }

  List<dynamic> title = [];
  allvalues() {
    db.get().then((value) {
      value.docs.forEach((e) {
        print(e['name']);
        // = e['name'];
        title.add(e['name']);
        setState(() {
          querySnapshotfornames = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Total Price is ${widget.total}"),
            // Text("${title[2]}"),
            Expanded(
              child: ListView.builder(
                itemCount: querySnapshotfornames.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(title[index]),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                  primary: false,
                  itemCount: querySnapshot.docs.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, i) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Address:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${querySnapshot.docs[i].get("Address")}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text("are youo sure you want to place order"),
                        actions: [
                          ElevatedButton(
                              onPressed: () {}, child: Text("cancel")),
                          ElevatedButton(
                              onPressed: () {
                                db.get().then((value) {
                                  for (DocumentSnapshot doc in value.docs) {
                                    doc.reference.delete();
                                    print('all delete');
                                  }
                                });
                              },
                              child: Text("sure")),
                        ],
                      );
                    });

                // db.doc(widget.docid).delete();
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (_) => CheckOutScreen(total: p)));
              },
              color: Colors.green,
              padding:
                  EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Text(
                "Place Order",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

getDriversList() async {
  return await FirebaseFirestore.instance
      .collection('Users')
      .where('userid', isEqualTo: user.uid)
      .get();
}
