import 'package:flutter/material.dart';
import 'package:photography_app/module/shared/colors.dart';
import 'package:photography_app/core.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  Widget build(context, OrderController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.mainColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Order',
          style: TextStyle(
            color: Colors.black,
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
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ReuTextField(
                  label: "Masukan No.telp",
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ReuTextField(
                  label: "Masukan Tempat",
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ReuDatePicker(
                  label: "Waktu",
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ReuTimePicker(
                  label: "Pilih Jam",
                  onChanged: (value) {},
                ),
              ),
              // const SizedBox(
              //   height: 12.0,
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
              //             onPressed: () {
              //               Navigator.of(context).push(
              //                 MaterialPageRoute(
              //                     builder: (context) =>
              //                         const SnapWebViewScreen()),
              //               );
              //             },
              //             child: const Text('Bayar'),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SnapWebViewScreen()),
            );
          },
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
