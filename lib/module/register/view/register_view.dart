// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photography_app/module/shared/colors.dart';

import '../controller/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController nameC = TextEditingController();
  late TextEditingController no_tlpC = TextEditingController();
  late TextEditingController emailC = TextEditingController();
  late TextEditingController passwdC = TextEditingController();
  late TextEditingController confPasswdC = TextEditingController();
  bool loading = false;

  TextInputType? keyboardType;

  FormFieldValidator<String>? validator;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                height: 650,
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
                        "Create an account.",
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
                            "Sudah punya akun? ",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Sign In",
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
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: TextFormField(
                                          controller: nameC,
                                          keyboardType: TextInputType.name,
                                          textInputAction: TextInputAction.next,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Nama Lengkap",
                                          ),
                                          validator: _requeiredValidator,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: TextFormField(
                                          controller: no_tlpC,
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Nomor Telepon",
                                            // prefixIcon: Icon(Icons.person),
                                          ),
                                          validator: _requeiredValidator,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: TextFormField(
                                          controller: emailC,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Email",
                                          ),
                                          validator: _requeiredValidator,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: TextFormField(
                                          controller: passwdC,
                                          textInputAction: TextInputAction.done,
                                          obscureText: true,
                                          decoration: const InputDecoration(
                                            hintText: "Password",
                                            border: InputBorder.none,
                                          ),
                                          validator: _requeiredValidator,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: TextFormField(
                                          controller: confPasswdC,
                                          textInputAction: TextInputAction.done,
                                          obscureText: true,
                                          decoration: const InputDecoration(
                                              hintText: "Konfirmasi Password",
                                              border: InputBorder.none),
                                          validator: _requeiredConfirmValidator,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  if (loading) ...[
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  ],
                                  if (!loading) ...[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            fit: FlexFit.tight,
                                            child: SizedBox(
                                              height: 50,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  backgroundColor:
                                                      ColorsApp.mainColor,
                                                ),
                                                onPressed: () {
                                                  if (_formKey.currentState !=
                                                          null &&
                                                      _formKey.currentState!
                                                          .validate()) {
                                                    sigUp();
                                                  }
                                                },
                                                child: const Text("Sign Up"),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Spacer(),
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

  String? _requeiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Form ini tidak boleh kosong!';
    } else {
      return null;
    }
  }

  String? _requeiredConfirmValidator(String? confirmPasswordText) {
    if (confirmPasswordText == null || confirmPasswordText.trim().isEmpty) {
      return 'Form ini tidak boleh kosong!';
    }
    if (passwdC.text != confirmPasswordText) {
      return 'Password tidak sama';
    } else {
      return null;
    }
  }

  Future sigUp() async {
    setState(() {
      loading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailC.text, password: passwdC.text);
      registerUser(nameC.text, no_tlpC.text, emailC.text, passwdC.text);

      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                  title: const Text('Pendaftaran Berhasil'),
                  content: const Text(
                      "Akun kamu sudah dibuat, kamu bisa masuk sekarang"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        FirebaseAuth.instance.signOut();
                        Get.deleteAll();
                      },
                      child: const Text("Oke"),
                    )
                  ]));
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      _handleSigupError(e);
      setState(() {
        loading = false;
      });
    }
  }

  void _handleSigupError(FirebaseAuthException e) {
    String messageToDisplay;
    switch (e.code) {
      case 'email-already-in-use':
        messageToDisplay = 'Email sudah ada';
        break;
      case 'invalid-email':
        messageToDisplay = 'Email tidak valid';
        break;
      case 'operation-not-allowed':
        messageToDisplay = 'Operasi tidak diperbolehkan';
        break;
      case 'weak-password':
        messageToDisplay = 'Kata sandi terlalu lemah';
        break;
      default:
        messageToDisplay = 'terjadi kesalahan yang tidak diketahui';
        break;
    }

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text("Pendaftaran Gagal"),
                content: Text(messageToDisplay),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Oke"),
                  )
                ]));
  }
}
