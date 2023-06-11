import 'package:flutter/material.dart';
import 'package:photography_app/core.dart';

class AdmInputDataView extends StatefulWidget {
  final Map? item;
  const AdmInputDataView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, AdmInputDataController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Kategori Foto"),
        backgroundColor: ColorsApp.mainColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      QImagePicker(
                        label: "Photo",
                        // validator: validator.required,
                        value: controller.photoUrl,
                        onChanged: (value) {
                          controller.photoUrl = value;
                        },
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      QTextField(
                        label: "Nama Kategori",
                        value: controller.name,
                        onChanged: (value) {
                          controller.name = value;
                        },
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      QTextField(
                        label: "Harga",
                        value: controller.price.toString(),
                        onChanged: (value) {
                          controller.price = int.parse(value);
                        },
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      QTextField(
                        label: "Deskrpsi",
                        value: controller.description,
                        onChanged: (value) {
                          controller.description = value;
                        },
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsApp.mainColor,
                        ),
                        onPressed: () => controller.doSave(),
                        child: const Text("Save"),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<AdmInputDataView> createState() => AdmInputDataController();
}
