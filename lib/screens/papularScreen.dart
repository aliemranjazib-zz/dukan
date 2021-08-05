import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/customwidgets/BottomNavBarWidget.dart';
import 'package:dukaan/customwidgets/GridTilesProducts.dart';
import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:dukaan/data/productdata.dart';

import 'package:flutter/material.dart';

class PopularScreens extends StatelessWidget {
  @override
  static const detailpagepapular = "/productdetail";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('products')
              .where('Popular', isEqualTo: true)
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
            final sc = snapshot.data.docs;
            return GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(1.0),
                childAspectRatio: 8.0 / 12.0,
                children: List<Widget>.generate(
                  sc.length,
                  (index) {
                    return GridTilesProducts(
                        imageUrl: "${sc[index].get("image ")}",
                        name: "${sc[index].get("name")}",
                        price: "${sc[index].get("Price")}",
                        onsale: "${sc[index].get("Onsale")}",
                        populap: "${sc[index].get("Popular")}",
                        catagory: "${sc[index].get("Product catagory")}",
                        wprice: "${sc[index].get("WholeSale Price")}",
                        scode: "${sc[index].get("Serial Code")}",
                        desc: "${sc[index].get("description")}",
                        orginal: "${sc[index].get("isOrignal")}",
                        type: "${sc[index].get("product type")}",
                        prodby: "${sc[index].get("Added By")}",
                        weight: "${sc[index].get("weight")}");
                  },
                ).toList());
          }),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
