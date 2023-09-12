import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home_app/screens/home_screen.dart';
import 'package:my_home_app/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(splash: Image(image: AssetImage("assets/icons/app_icon.jpg"),),
      duration: 2000,
       splashTransition: SplashTransition.fadeTransition,
           
            backgroundColor: Colors.white,
       nextScreen: SignupScreen())
    );
  }
}

