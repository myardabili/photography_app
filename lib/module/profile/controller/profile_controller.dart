import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photography_app/core.dart';

class ProfileController extends State<ProfileView> implements MvcController {
  static late ProfileController instance;
  late ProfileView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    getNamaWidget();
    getPhoneWidget();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? nama;
  String? nomor;
  String nullNomor = "-";

  doLogout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(const LoginView());
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

  getPhoneWidget() {
    var user = FirebaseAuth.instance.currentUser!.phoneNumber;
    var userEmail = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          nomor = snapshot.data()!['no_tlp'];
        });
      }
    });
    if (user != null) {
      return user;
    } else {
      return nomor;
    }
  }
}
