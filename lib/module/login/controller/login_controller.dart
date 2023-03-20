import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photography_app/core.dart';
import 'package:photography_app/module/shared/show_info_dialog.dart';
// import 'package:photography_app/module/dashboard/widget/navbar.dart';
// import 'package:photography_app/state_util.dart';
// import '../view/login_view.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String email = "";
  String password = "";

  doLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.offAll(const MainNavigationView());
    } on Exception {
      showInfoDialog("Email atau Password salah");
      // print(err);

    }
  }
}
