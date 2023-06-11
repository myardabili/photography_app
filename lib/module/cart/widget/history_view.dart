import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared/colors.dart';

class GetHistory extends StatefulWidget {
  const GetHistory({Key? key}) : super(key: key);

  @override
  State<GetHistory> createState() => _GetHistoryState();
}

class _GetHistoryState extends State<GetHistory> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("history")
          .where("owner_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text("Error");
        if (snapshot.data == null) return Container();
        if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              "Riwayat pesanan belum ada!",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
        final data = snapshot.data!;
        return ListView.builder(
          itemCount: data.docs.length,
          padding: EdgeInsets.zero,
          clipBehavior: Clip.none,
          itemBuilder: (context, index) {
            Map<String, dynamic> item =
                (data.docs[index].data() as Map<String, dynamic>);
            item["id"] = data.docs[index].id;
            return Card(
              color: Colors.white,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Riwayat Pesanan",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Konfirmasi'),
                                content: const SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('Hapus riwayat pesanan?'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[600],
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("No"),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorsApp.mainColor,
                                    ),
                                    onPressed: () async {
                                      await FirebaseFirestore.instance
                                          .collection("history")
                                          .doc(item["id"])
                                          .delete();
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Yes"),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: CircleAvatar(
                            backgroundColor: ColorsApp.mainColor,
                            child: const Icon(
                              Icons.delete,
                              size: 26.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Nama",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item["name"] ?? "-",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Kategori",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item["category"] ?? "-",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Lokasi",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item["location"] ?? "-",
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Tanggal",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item["date"] ?? "-",
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
