import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_home_app/screens/account_screen.dart';
import 'package:my_home_app/screens/addMoreFamily_screen.dart';
import 'package:my_home_app/screens/documents_screen.dart';
import 'package:my_home_app/screens/payments_screen.dart';


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
          drawerListTile(tileName: "Documents", tileIcon: Icons.edit_document,
          moveToScreen: () => DocumentScreen(),),
          drawerListTile(
            tileName: "Payments",
            tileIcon: Icons.account_balance_rounded,
            moveToScreen: () => PaymentScreen(),
          ),
          drawerListTile(
              tileName: "Add more family",
              tileIcon: Icons.family_restroom_rounded,
              moveToScreen: () => AddMoreFamilyScreen()
             ),
          drawerListTile(
              tileName: "Account",
              tileIcon: Icons.account_box_rounded,
             moveToScreen: () => AccountScreen()
             ),
          drawerListTile(tileName: "Logout", tileIcon: Icons.logout_rounded,
          moveToScreen: () => logoutPopUp(),)
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
          Get.to(moveToScreen!());
         //Navigator.push(context, MaterialPageRoute(builder: (context) => moveToScreen!(),));
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
  logoutPopUp(){
    return showDialog(context: context, 
    builder: (context) => AlertDialog(
      title: Text("Do you  want to exit from the app?"),
actions: [
  ElevatedButton(onPressed: (){
    Get.back();
  }, child: Text("No")),
    ElevatedButton(onPressed: (){
      SystemNavigator.pop();
    }, child: Text("Yes"))
],
       ),
    );
  }
}
