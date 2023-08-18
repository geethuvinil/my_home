import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CommonDrawer extends StatefulWidget {
  const CommonDrawer({super.key});

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      child: Column(
        children: [
          DrawerHeader(
              child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
            child: Center(
              child: Text(
                "Hi Geethu",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          )),
          drawerListTile(
              tileName: "Notifications", tileIcon: Icons.notifications),
          drawerListTile(tileName: "Documents", tileIcon: Icons.edit_document),
          drawerListTile(
            tileName: "Payments",
            tileIcon: Icons.account_balance_rounded,
          ),
          drawerListTile(
              tileName: "Add more family",
              tileIcon: Icons.family_restroom_rounded),
          drawerListTile(
              tileName: "Account",
              tileIcon: Icons.account_box_rounded,
             // moveToScreen: () => AccountScreen()
             ),
          drawerListTile(tileName: "Logout", tileIcon: Icons.logout_rounded)
        ],
      ),
    );
  }

  drawerListTile(
      {String? tileName, IconData? tileIcon, Function()? moveToScreen}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: ListTile(
        leading: Icon(
          tileIcon,
          size: 32,
        ),
        onTap: () {
          Get.back();
          Get.to(() => moveToScreen!());
        },
        title: Text(
          tileName ?? "",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
