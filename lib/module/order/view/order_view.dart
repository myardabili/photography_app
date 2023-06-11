import 'package:flutter/material.dart';
import 'package:photography_app/module/shared/colors.dart';
import 'package:photography_app/core.dart';

class OrderView extends StatefulWidget {
  var price;
  var category;
  OrderView({
    Key? key,
    required this.price,
    required this.category,
  }) : super(key: key);

  Widget build(context, OrderController controller) {
    controller.view = this;
    controller.price = price;
    controller.category = category;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.mainColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Order',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ReuTextField(
                  label: "Masukan Nama",
                  onChanged: (value) {
                    controller.name = value;
                  },
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ReuTextField(
                  label: "Masukan No.telp",
                  onChanged: (value) {
                    controller.phone = value;
                  },
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ReuTextField(
                  label: "Masukan Tempat",
                  onChanged: (value) {
                    controller.location = value;
                  },
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ReuDatePicker(
                  label: "Waktu",
                  onChanged: (value) {
                    controller.date = value.toString();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 6, right: 6),
        height: 80,
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsApp.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onPressed: () => controller.doSave(),
          child: const Text(
            "Bayar",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  State<OrderView> createState() => OrderController();
}
