import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photography_app/core.dart';

class AdmDashboardView extends StatefulWidget {
  const AdmDashboardView({Key? key}) : super(key: key);

  Widget build(context, AdmDashboardController controller) {
    controller.view = this;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.mainColor,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdmInputDataView()),
          );
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: ColorsApp.mainColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 10,
                      right: 10,
                      bottom: 10,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Hello,",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  FirebaseAuth
                                          .instance.currentUser!.displayName ??
                                      "-",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                FirebaseAuth.instance.currentUser!.photoURL ??
                                    "https://i.ibb.co/S32HNjD/no-image.jpg",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  bottom: -100,
                  right: 0,
                  left: 0,
                  child: BannerWidget(),
                ),
              ],
            ),
            const SizedBox(
              height: 120.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Pilihan Kategori",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("products")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return const Text("Error");
                    if (snapshot.data == null) return Container();
                    if (snapshot.data!.docs.isEmpty) {
                      return const Text("No Data");
                    }
                    final data = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.docs.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> item =
                            (data.docs[index].data() as Map<String, dynamic>);
                        item["id"] = data.docs[index].id;
                        return InkWell(
                          onTap: () => Get.to(AdmInputDataView(
                            item: item,
                          )),
                          child: Card(
                            shadowColor: Colors.grey,
                            clipBehavior: Clip.antiAlias,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: InkWell(
                                onTap: () => Get.to(AdmInputDataView(
                                  item: item,
                                )),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 120.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            item["photo_url"] ??
                                                "https://i.ibb.co/S32HNjD/no-image.jpg",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item["name"],
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              item["price"].toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 12.0,
                                        top: 12,
                                      ),
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor: ColorsApp.mainColor,
                                        child: IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text('Konfirmasi'),
                                                content:
                                                    const SingleChildScrollView(
                                                  child: ListBody(
                                                    children: <Widget>[
                                                      Text(
                                                          'Hapus kategori foto?'),
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.grey[600],
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("No"),
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          ColorsApp.mainColor,
                                                    ),
                                                    onPressed: () {
                                                      controller.doDelete(item);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("Yes"),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     controller: ScrollController(),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Container(
      //           width: MediaQuery.of(context).size.width,
      //           height: 170,
      //           color: ColorsApp.mainColor,
      //           child: Padding(
      //             padding: const EdgeInsets.all(20.0),
      //             child: Column(
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         const Text(
      //                           "Hello,",
      //                           style: TextStyle(
      //                             fontSize: 16.0,
      //                             color: Colors.white,
      //                           ),
      //                         ),
      //                         const SizedBox(
      //                           height: 2.0,
      //                         ),
      //                         Text(
      //                           FirebaseAuth
      //                                   .instance.currentUser!.displayName ??
      //                               "-",
      //                           style: const TextStyle(
      //                             fontSize: 16.0,
      //                             color: Colors.white,
      //                             fontWeight: FontWeight.bold,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     InkWell(
      //                       onTap: () => controller.doLogout(),
      //                       child: const CircleAvatar(
      //                         backgroundColor: Colors.white,
      //                         child: Icon(
      //                           Icons.logout_outlined,
      //                           color: Colors.black,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 const SizedBox(
      //                   height: 12.0,
      //                 ),
      //                 const FormSearch(),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Container(
      //           height: MediaQuery.of(context).size.height + 430,
      //           width: MediaQuery.of(context).size.width,
      //           transform: Matrix4.translationValues(0.0, -30, 0),
      //           decoration: const BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.all(
      //               Radius.circular(32.0),
      //             ),
      //           ),
      //           child: Padding(
      //             padding: const EdgeInsets.all(20.0),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Builder(builder: (context) {
      //                   List images = [
      //                     "https://tempat.info/wp-content/uploads/2022/12/Vibesroom-foto-studio-purwokerto.jpg",
      //                     "https://vibesroom.id/wp-content/uploads/2021/08/PRINT2.png",
      //                     "https://vibesroom.id/wp-content/uploads/2021/08/DSC03962.jpg"
      //                   ];
      //                   return Column(
      //                     children: [
      //                       CarouselSlider(
      //                         carouselController: controller.carouselController,
      //                         options: CarouselOptions(
      //                           height: 200.0,
      //                           autoPlay: true,
      //                           enlargeCenterPage: false,
      //                           viewportFraction: 1.0,
      //                           onPageChanged: (index, reason) {
      //                             controller.currentIndex = index;
      //                             controller.setState(() {});
      //                           },
      //                         ),
      //                         items: images.map((imageUrl) {
      //                           return Builder(
      //                             builder: (BuildContext context) {
      //                               return Container(
      //                                 width: MediaQuery.of(context).size.width,
      //                                 margin: const EdgeInsets.symmetric(
      //                                     horizontal: 5.0),
      //                                 decoration: BoxDecoration(
      //                                   color: Colors.amber,
      //                                   borderRadius: const BorderRadius.all(
      //                                     Radius.circular(32.0),
      //                                   ),
      //                                   image: DecorationImage(
      //                                     image: NetworkImage(
      //                                       imageUrl,
      //                                     ),
      //                                     fit: BoxFit.cover,
      //                                   ),
      //                                 ),
      //                               );
      //                             },
      //                           );
      //                         }).toList(),
      //                       ),
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: images.asMap().entries.map((entry) {
      //                           bool isSelected =
      //                               controller.currentIndex == entry.key;
      //                           return GestureDetector(
      //                             onTap: () => controller.carouselController
      //                                 .animateToPage(entry.key),
      //                             child: Container(
      //                               width: isSelected ? 40 : 6.0,
      //                               height: 6.0,
      //                               margin: const EdgeInsets.only(
      //                                 right: 6.0,
      //                                 top: 12.0,
      //                               ),
      //                             ),
      //                           );
      //                         }).toList(),
      //                       ),
      //                     ],
      //                   );
      //                 }),
      //                 const SizedBox(
      //                   height: 12.0,
      //                 ),
      //                 const Text(
      //                   "Kategori Foto",
      //                   style: TextStyle(
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   height: 12.0,
      //                 ),
      //                 Expanded(
      //                   child: StreamBuilder<QuerySnapshot>(
      //                     stream: FirebaseFirestore.instance
      //                         .collection("products")
      //                         .snapshots(),
      //                     builder: (context, snapshot) {
      //                       if (snapshot.hasError) {
      //                         return const Text("Error");
      //                       }
      //                       if (snapshot.data == null) return Container();
      //                       if (snapshot.data!.docs.isEmpty) {
      //                         return const Text("No Data");
      //                       }
      //                       final data = snapshot.data!;
      //                       return ListView.builder(
      //                         itemCount: data.docs.length,
      //                         padding: EdgeInsets.zero,
      //                         clipBehavior: Clip.none,
      //                         itemBuilder: (context, index) {
      //                           Map<String, dynamic> item = (data.docs[index]
      //                               .data() as Map<String, dynamic>);
      //                           item["id"] = data.docs[index].id;
      //                           return Dismissible(
      //                             key: UniqueKey(),
      //                             onDismissed: (detail) {},
      //                             confirmDismiss: (direction) async {
      //                               bool confirm = false;
      //                               await showDialog<void>(
      //                                 context: context,
      //                                 barrierDismissible: true,
      //                                 builder: (BuildContext context) {
      //                                   return AlertDialog(
      //                                     title: const Text('Confirm'),
      //                                     content: SingleChildScrollView(
      //                                       child: ListBody(
      //                                         children: const <Widget>[
      //                                           Text(
      //                                               'Hapus kategori foto ini?'),
      //                                         ],
      //                                       ),
      //                                     ),
      //                                     actions: <Widget>[
      //                                       ElevatedButton(
      //                                         style: ElevatedButton.styleFrom(
      //                                           backgroundColor:
      //                                               Colors.grey[600],
      //                                         ),
      //                                         onPressed: () {
      //                                           Navigator.pop(context);
      //                                         },
      //                                         child: const Text("No"),
      //                                       ),
      //                                       ElevatedButton(
      //                                         style: ElevatedButton.styleFrom(
      //                                           backgroundColor:
      //                                               ColorsApp.mainColor,
      //                                         ),
      //                                         onPressed: () {
      //                                           confirm = true;
      //                                           Navigator.pop(context);
      //                                         },
      //                                         child: const Text("Yes"),
      //                                       ),
      //                                     ],
      //                                   );
      //                                 },
      //                               );
      //                               if (confirm) {
      //                                 controller.doDelete(item);
      //                                 return Future.value(true);
      //                               }
      //                               return Future.value(false);
      //                             },
      //                             child: InkWell(
      //                               onTap: () => Get.to(AdmInputDataView(
      //                                 item: item,
      //                               )),
      //                               child: Card(
      //                                 shadowColor: Colors.yellow,
      //                                 clipBehavior: Clip.antiAlias,
      //                                 child: SizedBox(
      //                                   width:
      //                                       MediaQuery.of(context).size.width,
      //                                   child: Row(
      //                                     children: [
      //                                       Container(
      //                                         width: 120.0,
      //                                         height: 120.0,
      //                                         decoration: BoxDecoration(
      //                                           image: DecorationImage(
      //                                             image: NetworkImage(
      //                                               item["photo_url"] ??
      //                                                   "https://i.ibb.co/S32HNjD/no-image.jpg",
      //                                             ),
      //                                             fit: BoxFit.cover,
      //                                           ),
      //                                         ),
      //                                       ),
      //                                       const SizedBox(
      //                                         width: 12.0,
      //                                       ),
      //                                       Column(
      //                                         crossAxisAlignment:
      //                                             CrossAxisAlignment.start,
      //                                         children: [
      //                                           Text(
      //                                             item["name"],
      //                                             style: const TextStyle(
      //                                               fontSize: 16.0,
      //                                               fontWeight: FontWeight.bold,
      //                                             ),
      //                                           ),
      //                                           const SizedBox(
      //                                             height: 10.0,
      //                                           ),
      //                                           Text(
      //                                             item["price"],
      //                                             maxLines: 2,
      //                                             overflow:
      //                                                 TextOverflow.ellipsis,
      //                                             style: const TextStyle(
      //                                               fontSize: 12.0,
      //                                               fontWeight: FontWeight.bold,
      //                                             ),
      //                                           ),
      //                                         ],
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ),
      //                               ),
      //                             ),
      //                           );
      //                         },
      //                       );
      //                     },
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  @override
  State<AdmDashboardView> createState() => AdmDashboardController();
}
