import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photography_app/module/shared/colors.dart';
import 'package:photography_app/module/login/view/login_view.dart';
import '../../../state_util.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  Widget build(context, SplashController controller) {
    controller.view = this;

    Timer(
      const Duration(seconds: 1),
      () {
        Get.to(const LoginView());
      },
    );
    return Scaffold(
      backgroundColor: ColorsApp.mainColor,
      body: Center(
        child: Text(
          'Vibesroom',
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<SplashView> createState() => SplashController();
}
