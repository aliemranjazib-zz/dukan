import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:dukaan/screens/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

User user = FirebaseAuth.instance.currentUser;

class userdatascreen extends StatefulWidget {
  @override
  _userdatascreenState createState() => _userdatascreenState();
}

class _userdatascreenState extends State<userdatascreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
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
              return ListView.builder(
                  itemCount: ud.length,
                  itemBuilder: (context, i) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                height: 200,
                                width: double.infinity,
                                color: Colors.deepPurple,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'),
                                      radius: 40.0,
                                    ),
                                    Text(
                                      "${ud[i].get("name")}",
                                      style: TextStyle(
                                          fontSize: 32.0.sp,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  "Address",
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                subtitle: Text(
                                  ud[i].get("Address"),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  "Contact Number",
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                subtitle: Text(
                                  ud[i].get("Contact"),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  "Email Address",
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                subtitle: Text(
                                  ud[i].get("mail"),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          // MaterialButton(
                          //   color: Colors.grey,
                          //   onPressed: () {
                          //     Get.to(EditProfile());
                          //   },
                          //   child: Text("Edit Profile"),
                          // )
                        ],
                      ),
                    );
                  });
            }));
  }
}
