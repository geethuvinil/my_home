import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupRepo{
  Future<void> createUser(String userName,String userEmail,String userPassword,String userAddress,String userPhoneNumber,BuildContext context) async{
    final auth = FirebaseAuth.instance;
    final CollectionReference userRef = FirebaseFirestore.instance.collection("userCollection");


try {
 final userLoginCredentials =  await auth.createUserWithEmailAndPassword(email: userEmail, password: userPassword);
 await userRef.doc(userLoginCredentials.user!.uid).set({
  "userId":auth.currentUser!.uid,
  "name":userName,
  "email":userEmail,
  "phoneNumber":userPhoneNumber,
  "address":userAddress,
"password"  :userPassword
 });
} on FirebaseAuthException catch (e) {
  
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));
  throw Exception(e.code);

}
  }
}