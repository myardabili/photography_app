import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photography_app/module/login/view/login_view.dart';
import 'package:photography_app/state_util.dart';
import '../view/adm_dashboard_view.dart';

class AdmDashboardController extends State<AdmDashboardView>
    implements MvcController {
  static late AdmDashboardController instance;
  late AdmDashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  doDelete(Map<String, dynamic> item) async {
    await FirebaseFirestore.instance
        .collection("products")
        .doc(item["id"])
        .delete();
  }

  doLogout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(const LoginView());
  }
}
