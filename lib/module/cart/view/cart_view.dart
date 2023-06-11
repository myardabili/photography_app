// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:photography_app/core.dart';
import 'package:photography_app/module/cart/widget/get_transaction.dart';

class CartView extends StatefulWidget {
  final Map item;
  const CartView({
    Key? key,
    required this.item,
  }) : super(key: key);

  Widget build(context, CartController controller) {
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
                      GetTransaction(),
                      GetHistory(),
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
  State<CartView> createState() => CartController();
}
