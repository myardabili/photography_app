import 'package:flutter/material.dart';
import 'package:photography_app/core.dart';
import 'package:get/get.dart';

class DetailProductView extends StatelessWidget {
  final Map item;

  const DetailProductView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailProductController>(
      init: DetailProductController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                child: const BackButton(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        item["photo_url"],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  transform: Matrix4.translationValues(0.0, -24, 0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        item["name"],
                        style: const TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Deskripsi",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              item["description"],
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              item["price"].toString(),
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                      builder: (context) => OrderView(
                          price: item["price"].toString(),
                          category: item["name"])),
                );
              },
              child: const Text(
                "Pesan",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
      },
    );
  }
}
