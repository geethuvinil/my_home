import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home_app/repositories/signup_repo.dart';
import 'package:my_home_app/screens/login_screen.dart';

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
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Text(
                "WELCOME TO MY HOME APP",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            )),
            SizedBox(
              height: 10,
            ),
         Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please fill the field";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                    ),
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.all(14.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please fill the field";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your email id",
                    ),
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.all(14.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: phonenumberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please fill the field";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your phone number",
                    ),
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.all(14.0),
                  child: TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    controller: addressController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please fill the field";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your address",
                    ),
                  ),
                ),
             
                Padding(
                   padding: const EdgeInsets.all(14.0),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please fill the field";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                    ),
                  ),
                ),
                // SizedBox(
                //   child: TextButton(
                //       onPressed: () async {
                //         if (_formKey.currentState!.validate()) {
                //           await SignupRepo().createUser(
                //               _nameController.text,
                //               _emailController.text,
                //               _phonenumberController.text,
                //               _passwordController.text,
                //               context);
                //               Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage(),));
                              
                //         }
                //       },
                //       child: Text("signup")),
                // ),
              ],
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 30),
              child: ElevatedButton(onPressed: ()async{
if(_formKey.currentState!.validate()){
  await SignupRepo().createUser(
    nameController.text, 
    emailController.text,
     passwordController.text,
      addressController.text, 
      phonenumberController.text, context);
      Get.to(() => LoginScreen());
}

              }, child: Text("Submit")),
            )
          ],
        ),
      ),
    );
  }

 
  
}
