import 'package:flutter/material.dart';
import 'package:photography_app/module/shared/colors.dart';
import 'package:photography_app/core.dart';
import 'package:get/get.dart';

class InputDataView extends StatelessWidget {
  const InputDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputDataController>(
      init: InputDataController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Input Data"),
            centerTitle: true,
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
                            // validator: Validator.required,
                            value: null,
                            onChanged: (value) {
                              controller.photoUrl = value;
                            },
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          QTextField(
                            label: "Nama Kategori",
                            // validator: Validator.required,
                            onChanged: (value) {
                              controller.name = value;
                            },
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          QTextField(
                            label: "Harga",
                            // validator: Validator.required,
                            onChanged: (value) {
                              controller.price = value;
                            },
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          QTextField(
                            label: "Deskrpsi",
                            // validator: Validator.required,
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
      },
    );
  }
}
