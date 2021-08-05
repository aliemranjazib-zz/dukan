import 'package:dukaan/customwidgets/AppSignIn.dart';
import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:dukaan/models/flutterFire.dart';
import "package:flutter/material.dart";

class USerinfo extends StatefulWidget {
  @override
  _USerinfoState createState() => _USerinfoState();
}

class _USerinfoState extends State<USerinfo> {
  TextEditingController nameController = TextEditingController();

  TextEditingController adressController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String defaultFontFamily = 'Roboto-Light.ttf';
  double defaultFontSize = 14;
  double defaultIconSize = 17;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(context),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(
                child: Text(
                  "Provide additional Information",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      onFieldSubmitted: (v) {
                        nameController.text = v;
                      },
                      controller: nameController,
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
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                        ),
                        hintText: "Name",
                      )),
                  SizedBox(height: 15),
                  TextFormField(
                      onFieldSubmitted: (v) {
                        mailController.text = v;
                      },
                      controller: mailController,
                      keyboardType: TextInputType.emailAddress,
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
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                        ),
                        hintText: "Email Address",
                      )),
                  SizedBox(height: 15),
                  TextFormField(
                    onFieldSubmitted: (v) {
                      adressController.text = v;
                    },
                    controller: adressController,
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
                        fontFamily: defaultFontFamily,
                        fontSize: defaultFontSize,
                      ),
                      hintText: "Enter Address",
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                      onFieldSubmitted: (v) {
                        phoneC.text = v;
                      },
                      keyboardType: TextInputType.number,
                      controller: phoneC,
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
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                        ),
                        hintText: "Contact Number",
                      )),
                  SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.all(17.0),
                      onPressed: () {
                        saveuserinfo(nameController.text, adressController.text,
                            mailController.text, phoneC.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppSignIn()));
                      },
                      child: Text(
                        "Proceed To login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins-Medium.ttf',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      color: Color(0xFFBC1F26),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          side: BorderSide(color: Color(0xFFBC1F26))),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
