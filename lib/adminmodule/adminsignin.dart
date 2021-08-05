import 'package:dukaan/adminmodule/admindashbard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class adminsignin extends StatefulWidget {
  @override
  _adminsigninState createState() => _adminsigninState();
}

class _adminsigninState extends State<adminsignin> {
  final _key = GlobalKey<FormState>();
  String errorMessage;
  var email = 'admin@gmail.com';
  var password = '786786';
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  _trySubmit() {
    bool isValid = _formkey.currentState.validate();

    if (isValid) {
      // _formkey.currentState.save();
      // signup(emailC.text, passwordC.text);

      if (emailC.text == email && passwordC.text == password) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => AdminDashboard()));
        print('success');
      } else {
        print(' un success');
      }
      print(email);
      print(password);
      // print(passwordC.text);
    }
  }

  saveform(BuildContext context) {
    bool isValid = _key.currentState.validate();
    if (isValid) {
      _key.currentState.save();
      Get.to(AdminDashboard());
    }
  }

  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
          width: double.infinity,
          height: double.infinity,
          color: Colors.white70,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: InkWell(
                  child: Container(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.close),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Flexible(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 130,
                      height: 130,
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/ic_app_icon.png"),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Admin"),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: emailC,
                      onSaved: (value) {
                        emailC.text = value;
                      },
                      validator: (v) {
                        if (v.isEmpty || !v.contains("@")) {
                          return "enter valid email";
                        }
                        return null;
                      },
                      showCursor: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: Color(0xFF666666),
                          size: defaultIconSize,
                        ),
                        fillColor: Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                            color: Color(0xFF666666),
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize),
                        hintText: "Username",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: passwordC,
                      onSaved: (value) {
                        passwordC.text = value;
                      },
                      validator: (v) {
                        if (v.isEmpty || v.length < 6) {
                          return "enter valid password";
                        }
                        return null;
                      },
                      showCursor: true,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Color(0xFF666666),
                          size: defaultIconSize,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Color(0xFF666666),
                          size: defaultIconSize,
                        ),
                        fillColor: Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                        ),
                        hintText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        padding: EdgeInsets.all(17.0),
                        onPressed: () {
                          _trySubmit();
                        },
                        child: Text(
                          "Sign In",
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
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
