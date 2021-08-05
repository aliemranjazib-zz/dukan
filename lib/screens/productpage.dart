import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/customwidgets/BottomNavBarWidget.dart';
import 'package:dukaan/customwidgets/GridTilesProducts.dart';
import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:dukaan/customwidgets/drawerWidget.dart';
import 'package:dukaan/data/productdata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final routArg = ModalRoute.of(context).settings.arguments as Map;
    final catagoryname = routArg["title"];
    print(catagoryname);

    return Scaffold(
      appBar: appBarWidget(context),
      drawer: DrawerWidget(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('products')
            .where('Product catagory', isEqualTo: catagoryname)
            .snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final mydata = snapshot.data.docs;

          return GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(1.0),
            childAspectRatio: 8.0 / 12.0,
            children: List<Widget>.generate(mydata.length, (index) {
              return GridTile(
                  child: GridTilesProducts(
                      imageUrl: "${mydata[index].get("image ")}",
                      name: "${mydata[index].get("name")}",
                      price: "${mydata[index].get("Price")}",
                      onsale: "${mydata[index].get("Onsale")}",
                      populap: "${mydata[index].get("Popular")}",
                      catagory: "${mydata[index].get("Product catagory")}",
                      wprice: "${mydata[index].get("WholeSale Price")}",
                      scode: "${mydata[index].get("Serial Code")}",
                      desc: "${mydata[index].get("description")}",
                      orginal: "${mydata[index].get("isOrignal")}",
                      type: "${mydata[index].get("product type")}",
                      prodby: "${mydata[index].get("Added By")}",
                      weight: "${mydata[index].get("weight")}"));
            }).toList(),
          );
        },
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
