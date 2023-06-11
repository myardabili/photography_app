import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../state_util.dart';
import '../../detail_product/view/detail_product_view.dart';

class GetCategory extends StatefulWidget {
  const GetCategory({super.key});

  @override
  State<GetCategory> createState() => _GetCategoryState();
}

class _GetCategoryState extends State<GetCategory> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("products").snapshots(),
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
                return Card(
                  shadowColor: Colors.grey,
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () => Get.to(DetailProductView(
                        item: item,
                      )),
                      child: Row(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
