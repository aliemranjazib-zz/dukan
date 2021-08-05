import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/customwidgets/BottomNavBarWidget.dart';
import 'package:dukaan/customwidgets/PopularMenuWidget.dart';
import 'package:dukaan/customwidgets/Sliderwidget.dart';
import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:dukaan/customwidgets/drawerWidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class Hompage extends StatefulWidget {
  static const productpage = "/productpage";

  @override
  _HompageState createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  newScreen(BuildContext context, String titletext) {
    Navigator.of(context)
        .pushNamed(Hompage.productpage, arguments: {"title": titletext});
  }

  double width, height = 55.0;
  String namee;
  double customFontSize = 13;

  String defaultFontFamily = 'Roboto-Light.ttf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(context),
        drawer: DrawerWidget(),
        body: Column(
          children: [
            // SearchWidget(),
            TextField(
              onChanged: (String v) {
                setState(() {
                  namee = v;
                });
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "search...",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20))),
            ),
            sliderrr(),
            PopularMenu(),
            buildContainer("Catagories"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),
                  child: StreamBuilder(
                    stream: (namee != "" && namee != null)
                        ? FirebaseFirestore.instance
                            .collection('Catagories')
                            .where('namesearch', arrayContains: namee)
                            .snapshots()
                        : FirebaseFirestore.instance
                            .collection('Catagories')
                            .snapshots(),
                    builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                      // print(sc);
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
                      final sc = snapshot.data.docs;

                      return GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 10,
                        padding: EdgeInsets.all(1.0),
                        childAspectRatio: 7 / 4,
                        children: List<Widget>.generate(sc.length, (index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFF2F3F7)),
                                height: 30,
                                width: 30,
                                child: RawMaterialButton(
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    newScreen(
                                        context, "${sc[index].get("name")}");
                                  },
                                  child: Image.network(
                                    "${sc[index].get("image ")}",
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                              ),
                              Text("${sc[index].get("name")}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xFF444444),
                                      fontFamily: 'Roboto-Light.ttf',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            ],
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBarWidget());
  }

//   Future getcatagoryList() async {
//     return await FirebaseFirestore.instance
//         .collection('Catagories')
//         .where('namesearch', arrayContains: namee)
//         .snapshots();
//   }
// }

  Container buildContainer(String title) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
        child: Text(
          title,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
