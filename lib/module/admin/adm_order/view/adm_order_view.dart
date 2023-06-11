// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:photography_app/core.dart';
import 'package:photography_app/module/admin/adm_order/widget/adm_get_history.dart';
import 'package:photography_app/module/admin/adm_order/widget/adm_get_transaction.dart';

import '../controller/adm_order_controller.dart';

class AdmOrderView extends StatelessWidget {
  final Map item;
  const AdmOrderView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdmOrderController>(
      init: AdmOrderController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: ColorsApp.mainColor,
            title: const Text("Pesanan"),
            automaticallyImplyLeading: false,
          ),
          body: Container(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: ColorsApp.mainColor,
                      labelColor: Colors.black,
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      tabs: const [
                        Tab(
                          text: "Pesanan Berhasil",
                        ),
                        Tab(
                          text: "Riwayat",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: const TabBarView(
                        children: [
                          AdmGetTransaction(),
                          AdmGetHistory(),
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
