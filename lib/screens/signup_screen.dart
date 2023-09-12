import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Image(image: AssetImage("assets/icons/myhome.png")),
            ),
            Center(
                child: Padding(
              padding: EdgeInsets.only(top: 90, left: 20, right: 20),
              child: Text(
                "WELCOME TO MY HOME APP",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            )),
            SizedBox(
              height: 30,
            ),
            signupForm(
                hintTextString: "Enter your email id",
                type: TextInputType.emailAddress,
                controllerName: emailController),
            signupForm(
                hintTextString: "Enter your password",
                type: TextInputType.visiblePassword,
                controllerName: passwordController),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(onPressed: () {}, child: Text("Submit")),
            )
          ],
        ),
      ),
    );
  }

  signupForm(
      {String? hintTextString,
      TextEditingController? controllerName,
      TextInputType? type}) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Form(
        key: _formKey,
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "Please fill the field";
            }
          },
          controller: controllerName,
          decoration: InputDecoration(hintText: hintTextString ?? ""),
        ),
      ),
    );
  }
}
