import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModifyDataScreen extends StatefulWidget {
  final String name;
  final String price;
  bool onsale;
  bool populap;
  final String catagory;
  final String wprice;
  final String scode;
  final String desc;
  final String orginal;
  final String type;
  final String prodby;
  final String weight;
  final String docid;

  ModifyDataScreen({
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
    this.weight,
    this.docid,
  });

  @override
  _ModifyDataScreenState createState() => _ModifyDataScreenState();
}

class _ModifyDataScreenState extends State<ModifyDataScreen> {
  TextEditingController nameC;

  TextEditingController descriptionC;
  TextEditingController catagoryC;
  TextEditingController serialC;
  TextEditingController wpriceC;
  TextEditingController priceC;
  TextEditingController orgC;
  TextEditingController weightC;
  TextEditingController typeC;

  update() {
    FirebaseFirestore.instance.collection('products').doc(widget.docid).update({
      'Onsale': widget.onsale,
      'name': nameC.text,
      'description': descriptionC.text,
      'Product catagory': catagoryC.text,
      'Serial Code': serialC.text,
      'WholeSale Price': wpriceC.text,
      'Price': priceC.text,
      'isOrignal': orgC.text,
      'weight': weightC.text,
      'product type': typeC.text,
      'Popular': widget.populap,
    });
  }

  @override
  void initState() {
    nameC = TextEditingController();
    descriptionC = TextEditingController();
    catagoryC = TextEditingController();
    serialC = TextEditingController();
    wpriceC = TextEditingController();
    priceC = TextEditingController();
    orgC = TextEditingController();
    weightC = TextEditingController();
    typeC = TextEditingController();
    print(widget.populap);
    print(widget.docid);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    File _image;
    var genderlist = [
      'Electronics',
      'Accessories',
      'Home Appliances',
      'Health & Beauty',
      'Babies & Toys',
      'Groceries & Pets',
      'Lifestyle',
      'Fashion',
      'Mens Fashion',
      'Watches & Jewelery'
    ];
    var genderDefaultValue = widget.catagory;
    final style = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: Text("Dukaan Seller"),
      ),
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  child: Column(
                    children: [
                      Text(
                        "Edit Product",
                        style: style,
                      ),
                      TextFormField(
                          controller: nameC,
                          onFieldSubmitted: (v) {
                            nameC.text = v;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
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
                            labelText: widget.name,
                          )),
                      SizedBox(height: 20.h),
                      DropdownButtonFormField(
                        onSaved: (v) {
                          catagoryC.text = v;
                        },
                        onChanged: (value) {
                          setState(() {
                            catagoryC.text = value;
                          });
                        },
                        value: genderDefaultValue,
                        items: genderlist
                            .map((e) => DropdownMenuItem(
                                value: e, child: Text(e.toString())))
                            .toList(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0.w,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                            color: Color(0xFF666666),
                          ),
                          // hintText: "Product Catagory",
                          // labelText: widget.catagory,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      TextFormField(
                          controller: serialC,
                          onFieldSubmitted: (v) {
                            serialC.text = v;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 0.w,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF2F3F5),
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                            ),
                            // hintText: "Serial Code Sku-123",
                            labelText: widget.scode,
                          )),
                      SizedBox(height: 20.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          height: 225.h,
                          child: _image == null
                              ? Center(
                                  child: Text(
                                    "no images selected",
                                  ),
                                )
                              : Image.file(
                                  _image,
                                ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('please select image'),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.camera_alt))
                        ],
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: descriptionC,
                        onFieldSubmitted: (v) {
                          descriptionC.text = v;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0.w,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                            color: Color(0xFF666666),
                          ),
                          labelText: widget.desc,
                        ),
                        maxLines: 10,
                      ),
                      SizedBox(height: 20.h),
                      TextFormField(
                          controller: priceC,
                          onFieldSubmitted: (v) {
                            priceC.text = v;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 0.w,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF2F3F5),
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                            ),
                            // hintText: "Price",
                            labelText: widget.price,
                          )),
                      SizedBox(height: 20.h),
                      TextFormField(
                          controller: wpriceC,
                          onFieldSubmitted: (v) {
                            wpriceC.text = v;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 0.w,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF2F3F5),
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                            ),
                            // hintText: "Wholesale Price",
                            labelText: widget.wprice,
                          )),
                      SizedBox(height: 20.h),
                      TextFormField(
                          controller: orgC,
                          onFieldSubmitted: (v) {
                            orgC.text = v;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 0.w,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF2F3F5),
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                            ),
                            // hintText: "Orignal / Replica",
                            labelText: widget.orginal,
                          )),
                      SizedBox(height: 20.h),
                      TextFormField(
                          controller: weightC,
                          onFieldSubmitted: (v) {
                            weightC.text = v;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 0.w,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF2F3F5),
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                            ),
                            // hintText: "Weight",
                            labelText: widget.weight,
                          )),
                      SizedBox(height: 20.h),
                      TextFormField(
                          controller: typeC,
                          onFieldSubmitted: (v) {
                            typeC.text = v;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
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
                            // hintText: "Product Type",
                            labelText: widget.type,
                          )),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text("onsale"),
                          Switch(
                            value: widget.onsale,
                            onChanged: (value) {
                              setState(() {
                                widget.onsale = value;
                              });
                            },
                          ),
                          Text("ispopular"),
                          Switch(
                            value: widget.populap,
                            onChanged: (value) {
                              setState(() {
                                widget.populap = value;
                                print(value);
                              });
                            },
                          ),
                        ],
                      ),
                      RaisedButton(
                        padding: EdgeInsets.all(17.0),
                        onPressed: () {
                          update();
                        },
                        child: Text(
                          "Update",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'Poppins-Medium.ttf',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        color: Color(0xFFBC1F26),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                            side: BorderSide(color: Color(0xFFBC1F26))),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
