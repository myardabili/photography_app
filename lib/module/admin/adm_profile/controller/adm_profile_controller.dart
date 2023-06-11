import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../login/view/login_view.dart';
import '../view/adm_profile_view.dart';

class AdmProfileController extends GetxController {
  AdmProfileView? view;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  doLogout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(const LoginView());
  }
}
