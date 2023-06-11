import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photography_app/state_util.dart';
import '../view/dashboard_view.dart';

class DashboardController extends State<DashboardView>
    implements MvcController {
  static late DashboardController instance;
  late DashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    getNamaWidget();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? nama;

  doGet() async {
    FirebaseFirestore.instance.collection("products").snapshots();
  }

  getNamaWidget() {
    var user = FirebaseAuth.instance.currentUser;
    var userEmail = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          nama = snapshot.data()!['nama_lengkap'];
        });
      }
    });
    if (user != null) {
      if (user.providerData[0].providerId == "google.com") {
        return user.displayName;
      } else if (userEmail != null) {
        return nama;
      } else {
        return Text("-");
      }
    }
  }
}
