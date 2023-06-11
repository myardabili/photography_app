import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:photography_app/core.dart';
import 'package:photography_app/module/admin/adm_dashboard/view/adm_dashboard_view.dart';
import 'package:photography_app/state_util.dart';
import '../../../shared/show_info_dialog.dart';
import '../view/adm_input_data_view.dart';

class AdmInputDataController extends State<AdmInputDataView>
    implements MvcController {
  static late AdmInputDataController instance;
  late AdmInputDataView view;

  @override
  void initState() {
    instance = this;
    if (isEditMode) {
      id = widget.item!["id"];
      photoUrl = widget.item!["photo_url"];
      name = widget.item!["name"];
      price = widget.item!["price"];
      description = widget.item!["description"];
    }
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? id;
  String? photoUrl;
  String? name;
  int? price;
  String? description;

  bool get isEditMode {
    return widget.item != null;
  }

  doSave() async {
    if (isEditMode) {
      await FirebaseFirestore.instance.collection("products").doc(id).update({
        "photo_url": photoUrl,
        "name": name,
        "price": price,
        "description": description,
      });
      showInfoDialog("Success!");
      Get.to(const AdmMainNavigationView());
    } else {
      await FirebaseFirestore.instance.collection("products").add({
        "photo_url": photoUrl,
        "name": name,
        "price": price,
        "description": description,
      });
      showInfoDialog("Success!");
      Get.to(const AdmMainNavigationView());
    }
  }
}
