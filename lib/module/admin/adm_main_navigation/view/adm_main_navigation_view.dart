import 'package:flutter/material.dart';
import 'package:photography_app/core.dart';

class AdmMainNavigationView extends StatefulWidget {
  const AdmMainNavigationView({Key? key}) : super(key: key);

  @override
  State<AdmMainNavigationView> createState() => _AdmMainNavigationViewState();
}

class _AdmMainNavigationViewState extends State<AdmMainNavigationView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: const [
            AdmDashboardView(),
            AdmOrderView(
              item: {},
            ),
            AdmProfileView()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: ColorsApp.mainColor,
          unselectedItemColor: Colors.grey[500],
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "Order",
              icon: Icon(
                Icons.list,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profil",
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
