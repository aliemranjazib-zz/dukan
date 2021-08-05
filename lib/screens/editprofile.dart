import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:dukaan/models/flutterFire.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameC;
  TextEditingController addressC;
  TextEditingController mailC;
  TextEditingController contactC;

  void initState() {
    nameC = TextEditingController();
    addressC = TextEditingController();
    mailC = TextEditingController();
    contactC = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: appBarWidget(context),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .where('userid', isEqualTo: user.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var ud = snapshot.data.docs;
            return Column(
              children: [
                Text(
                  "Edit Product",
                  style: style,
                ),
                SizedBox(height: 20),
                TextFormField(
                    controller: nameC,
                    onFieldSubmitted: (v) {
                      nameC.text = v;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                      ),
                      // hintText: "Product Name",
                      labelText: "${ud[0].get("name")}",
                    )),
                SizedBox(height: 20),
                TextFormField(
                    controller: addressC,
                    onFieldSubmitted: (v) {
                      addressC.text = v;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                      ),
                      // hintText: "Product Name",
                      labelText: "${ud[0].get("Address")}",
                    )),
                SizedBox(height: 20),
                TextFormField(
                    controller: mailC,
                    onFieldSubmitted: (v) {
                      mailC.text = v;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                      ),
                      // hintText: "Product Name",
                      labelText: "${ud[0].get("mail")}",
                    )),
                SizedBox(height: 20),
                TextFormField(
                    controller: contactC,
                    onFieldSubmitted: (v) {
                      contactC.text = v;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                      ),
                      // hintText: "Product Name",
                      labelText: "${ud[0].get("Contact")}",
                    )),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      // FirebaseFirestore.instance
                      //     .collection("Users")
                      //     .doc(snapshot.data.docs[0].id)
                      //     .update({
                      //   "Address": addressC.text,
                      //   "mail": mailC.text,
                      //   "Contact": contactC.text,
                      //   "name": nameC.text

                      // }
                      print("${nameC.text}");
                    },
                    child: Text("Shipped")),
              ],
            );
          }),
    );
  }
}
