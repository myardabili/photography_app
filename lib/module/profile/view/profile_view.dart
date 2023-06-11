import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photography_app/core.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsApp.mainColor,
        title: const Text("Profile"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 20.0,
          ),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser!.photoURL ??
                        "https://i.ibb.co/S32HNjD/no-image.jpg",
                  ),
                  radius: 40,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Divider(),
              ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: ColorsApp.mainColor,
                  ),
                ),
                title: Text(
                  controller.getNamaWidget().toString(),
                ),
              ),
              ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Icon(
                    Icons.phone,
                    color: ColorsApp.mainColor,
                  ),
                ),
                title: Text(
                  controller.getPhoneWidget().toString(),
                ),
              ),
              ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Icon(
                    Icons.email_outlined,
                    color: ColorsApp.mainColor,
                  ),
                ),
                title: Text("${FirebaseAuth.instance.currentUser!.email}"),
              ),
              const SizedBox(
                height: 30.0,
              ),
              InkWell(
                onTap: () => controller.doLogout(),
                child: ListTile(
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Icon(
                      Icons.logout,
                      color: ColorsApp.mainColor,
                    ),
                  ),
                  title: const Text("Logout"),
                  trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
