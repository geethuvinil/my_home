import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Text(
                "UPCOMING PAYMENTS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Divider(),
            upcomingPaymentWidget(),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "COMPLETED PAYMENTS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Divider(),
            completedPaymentWidget(),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  upcomingPaymentWidget() {
    return ListView.builder(
       physics:  BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8, left: 13, right: 13),
          child: ListTile(
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            tileColor: Colors.orange.shade100,
            title: SizedBox(
                child: Text(
              "KERALA STATE ELECTRICITY BOARD",
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            )),
            subtitle: Text(
              "Rs.4890 /- ",
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
            ),
            trailing: ElevatedButton(onPressed: () {}, child: Text("Pay now")),
          ),
        );
      },
    );
  }
completedPaymentWidget(){
  return ListView.builder(
    physics:  BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 7,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8, left: 13, right: 13),
          child: ListTile(
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            tileColor: Colors.green.shade100,
            title: SizedBox(
                child: Text(
              "MARUTI SUZUKI SWIFT CAR INSURANCE",
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            )),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              "Rs.15,000 /- ",
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
            ),
            Text(
              "25/04/2023, 10:55 AM",
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue),
            ),
           
              ],
            ),
           trailing: Icon(Icons.verified_rounded,color: Colors.blue.shade800,size: 28,),
          ),
        );
      },
    );

}

}
