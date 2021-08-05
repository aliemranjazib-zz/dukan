import 'package:flutter/material.dart';

class GridTilesProducts extends StatelessWidget {
  static const detailpage = "/productdetail";
  newScreen(BuildContext context, String productname) {
    Navigator.of(context).pushNamed(detailpage, arguments: {
      "pname": productname,
      "pimage": imageUrl,
      "pprice": price,
      "ponsale": onsale,
      "ppopular": populap,
      "pcat": catagory,
      "pwprice": wprice,
      "pscode": scode,
      "pdesc": desc,
      "prodby": prodby,
      "porignal": orginal,
      "ptype": type,
      "pweight": weight,
    });
  }

  final String imageUrl;
  final String name;
  final String price;
  final String onsale;
  final String populap;
  final String catagory;
  final String wprice;
  final String scode;
  final String desc;
  final String orginal;
  final String type;
  final String prodby;
  final String weight;

  const GridTilesProducts(
      {Key key,
      this.imageUrl,
      this.name,
      this.price,
      this.onsale,
      this.populap,
      this.catagory,
      this.wprice,
      this.scode,
      this.desc,
      this.orginal,
      this.type,
      this.prodby,
      this.weight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          elevation: 0,
          child: Center(
            child: InkWell(
              onTap: () {
                newScreen(context, name);
              },
              child: Column(
                children: <Widget>[
                  Image.network(
                    imageUrl,
                    height: 150,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                    child: Text(
                        (name.length <= 40 ? name : name.substring(0, 40)),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color(0xFF444444),
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Text("RS $price",
                        style: TextStyle(
                            color: (price != null)
                                ? Color(0xFFf67426)
                                : Color(0xFF0dc2cd),
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
