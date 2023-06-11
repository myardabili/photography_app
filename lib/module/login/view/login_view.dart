import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photography_app/core.dart';
import 'package:photography_app/module/login/widget/main_button.dart';
import 'package:photography_app/module/login/widget/text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: ColorsApp.mainColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Center(
                    child: Text(
                      'Vibesroom',
                      style: GoogleFonts.lobster(
                        textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 600,
                transform: Matrix4.translationValues(0.0, -30, 0),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        "Welcome Back!",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Belum punya akun? ",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.to(const RegisterView()),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: ColorsApp.mainColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      RTextField(
                        label: 'Email',
                        onChanged: (value) {
                          controller.email = value;
                        },
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      RTextField(
                        label: 'Password',
                        onChanged: (value) {
                          controller.password = value;
                        },
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                "Lupa password?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      MainButton(
                        label: 'Login',
                        onPressed: () => controller.doLogin(),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      //   child: Row(
                      //     children: [
                      //       Flexible(
                      //         flex: 1,
                      //         fit: FlexFit.tight,
                      //         child: SizedBox(
                      //           height: 50,
                      //           child: ElevatedButton(
                      //             style: ElevatedButton.styleFrom(
                      //                 shape: RoundedRectangleBorder(
                      //                   borderRadius: BorderRadius.circular(12),
                      //                 ),
                      //                 backgroundColor: ColorsApp.mainColor),
                      //             onPressed: () => controller.doLogin(),
                      //             child: const Text('Sign In'),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "Or",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor: ColorsApp.mainColor),
                              onPressed: () => controller.doGoogleLogin(),
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/google_icon.png",
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.fill,
                                      ),
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                      Text('Login by Google'),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
