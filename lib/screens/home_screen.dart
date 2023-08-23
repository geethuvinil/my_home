import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphview/GraphView.dart';
import 'package:my_home_app/common_widgets/common_drawer.dart';
import 'package:my_home_app/screens/account_screen.dart';
import 'package:my_home_app/screens/treeview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton(
            items: [],
            onChanged: (value) {},
            icon: Icon(
              Icons.arrow_drop_down,
              size: 42,
            ),
            iconDisabledColor: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_active_sharp,
                size: 34,
              )),
              SizedBox(
            width: 10,
          ),
          IconButton(onPressed: (){
            Get.to(() => AccountScreen());
          }, icon: Icon(Icons.account_circle,size: 34,))
        ],
      ),
      drawer: CommonDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                child: Text("Marathezhuth Family",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height:MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: TreeViewPage()),
         
          ],
        ),
      ),
    );
  }
  
}
