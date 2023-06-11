import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photography_app/module/order/widget/midtrans_payment.dart';
import 'package:photography_app/state_util.dart';
import '../view/order_view.dart';

class OrderController extends State<OrderView> implements MvcController {
  static late OrderController instance;
  late OrderView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  // int selectedIndex = 0;
  String? id;
  String? name;
  String? phone;
  String? location;
  String? date;
  // String? time;
  String? price;
  String? category;

  // CollectionReference product = firestore.collection("transaction");
  doSave() async {
    await FirebaseFirestore.instance.collection("transaction").add({
      "owner_id": FirebaseAuth.instance.currentUser!.uid,
      "name": name,
      "category": category,
      "phone": phone,
      "location": location,
      "date": date,
    }).then((docRef) {
      id = docRef.id;
      print(id);
      // Lakukan apa pun yang perlu Anda lakukan dengan docId di sini
    }).catchError((error) {
      print("Error adding transaction: $error");
    });

    Get.to(MidtansPayment(
      id: id,
      name: name,
      phone: phone,
      location: location,
      date: date,
      // time: time,
      price: price,
      category: category,
    ));
  }
}
