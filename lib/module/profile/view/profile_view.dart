import 'package:flutter/material.dart';
import 'package:photography_app/module/shared/colors.dart';
import 'package:photography_app/core.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsApp.mainColor,
        title: const Text("Profile"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: ColorsApp.mainColor,
                  ),
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
                title: const Text("Muhammad Yusuf Ardabili"),
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
                title: const Text("082242906985"),
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
                title: const Text("muhammadyusufnew16@gmail.com"),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  child: const Text("Edit Profile"),
                ),
              ),
              // const SizedBox(
              //   height: 18.0,
              // ),
              ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Icon(
                    Icons.delete_outline_rounded,
                    color: ColorsApp.mainColor,
                  ),
                ),
                title: const Text("Delete Account"),
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
