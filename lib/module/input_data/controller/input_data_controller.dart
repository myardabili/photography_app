import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:photography_app/core.dart';

class InputDataController extends GetxController {
  InputDataView? view;

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

  String? photoUrl;
  String? name;
  String? price;
  String? description;
  doSave() async {
    await FirebaseFirestore.instance.collection("products").add({
      "photo_url": photoUrl,
      "name": name,
      "price": price,
      "description": description,
    });
    showInfoDialog("Success!");
  }
}
