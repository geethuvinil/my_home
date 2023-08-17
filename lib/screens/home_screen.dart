import 'package:flutter/material.dart';
import 'package:my_home_app/common_widgets/common_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle,size: 34,))
        ],
      ),
      drawer: CommonDrawer(),
    );
  }
}
