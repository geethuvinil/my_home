import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home_app/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "Enter your email id and password to login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(14),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: TextFormField(
                          controller: loginEmailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "this field is mandatory";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Enter your email id",
                          ),
                        ),
                      ),
                      SizedBox(
                        child: TextFormField(
                          controller: loginPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "this field is mandatory";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                            onPressed: () async {
                              try {
                                final auth = FirebaseAuth.instance;
                                final userRefernce =
                                    await auth.signInWithEmailAndPassword(
                                        email: loginEmailController.text,
                                        password: loginPasswordController.text);
                                Get.to(() => HomeScreen());
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "invalid username or password")));
                              }
                            },
                            child: Text("Login")),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
