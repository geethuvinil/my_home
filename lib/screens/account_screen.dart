import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: BackButton(),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 25),
                child: AvatarView(
                  radius: 100,
                  borderWidth: 2,
                  borderColor: Colors.black,
                  imagePath: "assets/members_images/anju.jpg",
                  avatarType: AvatarType.CIRCLE,
                  errorWidget: Container(
                    child: Icon(
                      Icons.error,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              accountDetailsTile(
                  titleName: "Name",
                  subTitleName: "Neethu M A",
                  iconName: Icons.person),
              accountDetailsTile(
                  titleName: "Address",
                  subTitleName: "abc hashdunujsdjknkju",
                  iconName: Icons.location_on),
                   accountDetailsTile(
                  titleName: "Phone Number",
                  subTitleName: "0091 9947720297",
                  iconName: Icons.call),
                   accountDetailsTile(
                  titleName: "Email Id",
                  subTitleName: "avcdmjm@gmail.com",
                  iconName: Icons.mail),
                   accountDetailsTile(
                  titleName: "Password",
                  subTitleName: "aabbcc1233",
                  iconName: Icons.password),
                  SizedBox(
                    height: 20,
                  )
                  
            ],
          )
        ],
      )),
    );
  }

  accountDetailsTile(
      {String? titleName, String? subTitleName, IconData? iconName}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(
            titleName ?? "",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 18, color: Colors.black),
          ),
          subtitle: SizedBox(
            child: Text(
              subTitleName ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 15, color: Colors.black),
            ),
          ),
          leading: Icon(
            iconName,
            size: 25,
          ),
        ),
      ),
    );
  }
}
