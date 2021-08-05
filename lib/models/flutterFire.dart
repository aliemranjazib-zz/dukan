import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukaan/customwidgets/AppSignIn.dart';
import 'package:dukaan/screens/CartPage.dart';
import 'package:dukaan/screens/homepage.dart';
import 'package:dukaan/sellerModules/addproduct.dart';
import 'package:dukaan/sellerModules/sellerdashboardcard.dart';
import 'package:dukaan/sellerModules/userdeatils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

User user = FirebaseAuth.instance.currentUser;
final uid = FirebaseAuth.instance.currentUser.uid;

addtocart(BuildContext context, int price, String name, int quantity,
    String addedby, String image) {
  FirebaseFirestore.instance
      .collection('cart')
      .doc(uid)
      .collection('cartsdata')
      .add({
    'name': name,
    'image': image,
    "quantity": quantity,
    "addedby": addedby,
    "price": price,
    'userid': uid,
  });
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => CartPage()));
}

addtoorders(
    BuildContext context,
    List title,
    int tPrice,
    String orderBy,
    List addedBy,
    List quan,
    String deliveryAddress,
    String namee,
    String contact) {
  FirebaseFirestore.instance
      .collection('order')
      .doc(uid)
      .collection('ordersdata')
      .add({
    'Prodname': title,
    'Total Price': tPrice,
    'Order by': orderBy,
    'Prodby': addedBy,
    'Quantity': quan,
    'Adress': deliveryAddress,
    'payment method': "COD",
    'Order Status': 'Received',
    'Customer name': namee,
    'Contact': contact,
    'DATE': DateTime.now(),
  }).then((value) => print("addded"));
}

Future<bool> saveinfo(
  String title,
  String description,
  String catagory,
  String serial,
  String wprice,
  String price,
  Future url,
) async {
  FirebaseFirestore db = FirebaseFirestore.instance;

  db.collection("products").add({
    'name': title,
    'description': description,
    'Product catagory': catagory,
    'Serial Code': serial,
    'WholeSale Price': wprice,
    'Price': price,
    'Added By': user.uid,
    'image ': url,
  });

  return true;
}

Future<bool> saveuserinfo(
  String name,
  String address,
  String email,
  String Contact,
) async {
  FirebaseFirestore db = FirebaseFirestore.instance;

  db.collection("Users").add({
    'name': name,
    'Address': address,
    'mail': email,
    'Contact': Contact,
    'userid': user.uid,
  });

  return true;
}

Future<bool> saveorderinfo(
  String name,
  String cname,
  String address,
  String email,
  String Contact,
  String bill,
  String pby,
) async {
  FirebaseFirestore db = FirebaseFirestore.instance;

  db.collection("Orders").add({
    'Product': name,
    'Orderby': cname,
    'Address': address,
    'mail': email,
    'Contact': Contact,
    'OrderBY': user.uid,
    'Payment': bill,
    'Paymethod': "Cash on Dilevery",
    'Product By': pby,
  });

  return true;
}

void signup(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    Get.to(USerinfo());
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Get.snackbar('error', 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      Get.snackbar('error', 'The account already exists for that email.',
          backgroundColor: Color(0Xff20fd));
    }
  } catch (e) {
    print(e);
  }
}

void signin(String email, String password) async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
  Get.to(Sellerdashboard());
}

void signout() async {
  await FirebaseAuth.instance.signOut();
}

@override
Future<void> resetPassword(String email) async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}
