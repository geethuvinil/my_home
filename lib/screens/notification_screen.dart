import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 11,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8, left: 13, right: 13,bottom: 5),
            child: ListTile(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              tileColor: Colors.yellow,
              title: Text(
                "You have not payed your KSEB bill for month June on xxxxx",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amount to pay = 7500",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.red),
                  ),
                  Text(
                    "Due date = 29-06-2023",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.blue),
                  ),
                ],
              ),
            ),
          );
          
        },
      )),
    );
  }
}
