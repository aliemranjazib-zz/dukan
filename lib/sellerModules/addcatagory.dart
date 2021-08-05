import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/customwidgets/appbaar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCatagory extends StatefulWidget {
  @override
  _AddCatagoryState createState() => _AddCatagoryState();
}

class _AddCatagoryState extends State<AddCatagory> {
  @override
  final picker = ImagePicker();
  File _image;
  final _formKey = GlobalKey<FormState>();
  String defaultFontFamily = 'Roboto-Light.ttf';
  TextEditingController idC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  double defaultFontSize = 14;
  double defaultIconSize = 17;
  Future pickImage() async {
    final pickImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickImage != null) {
        _image = File(pickImage.path);
      } else {
        print('no image selected');
      }
    });
  }

  setSearchParam(String caseNumber) {
    List<String> caseSearchList = List();
    String temp = "";
    for (int i = 0; i < caseNumber.length; i++) {
      temp = temp + caseNumber[i];
      caseSearchList.add(temp);
    }
    return caseSearchList;
  }

  Future<String> uploadFile(File _image) async {
    String downloadURL;
    String postId = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("catagorys")
        .child("post_$postId.png");
    await ref.putFile(_image);
    downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  saveform(BuildContext context) {
    bool isValid = _formKey.currentState.validate();
    if (isValid) {
      _formKey.currentState.save();
      uploadToFirebase();
    }
  }

  uploadToFirebase() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    String url = await uploadFile(
        _image); // this will upload the file and store url in the variable 'url'

    await db.collection("Catagories").add({
      'Id': idC.text,
      'namesearch': setSearchParam(nameC.text),
      'name': nameC.text,
      'image ': url,
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                  child: Text(
                    "Add Catagory",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: idC,
                        onFieldSubmitted: (v) {
                          idC.text = v;
                        },
                        validator: (v) {
                          if (v.isEmpty) {
                            return "enter Data";
                          }
                          return null;
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
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                          ),
                          hintText: "Catagory ID",
                        )),
                    SizedBox(height: 15.h),
                    TextFormField(
                        controller: nameC,
                        onFieldSubmitted: (v) {
                          nameC.text = v;
                        },
                        validator: (v) {
                          if (v.isEmpty || v.length < 6) {
                            return "entername";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
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
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                          ),
                          hintText: "Catagory Name",
                        )),
                    SizedBox(height: 15.h),
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
                        Text('please select catagory Icon'),
                        IconButton(
                            onPressed: () {
                              pickImage();
                            },
                            icon: Icon(Icons.camera_alt))
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        padding: EdgeInsets.all(17.0),
                        onPressed: () {
                          saveform(context);

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Sellerdashboard()));
                        },
                        child: Text(
                          "Add Catagory",
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
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
