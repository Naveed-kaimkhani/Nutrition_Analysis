import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutritionanalysis/Screens/HomeScreen.dart';
import 'package:nutritionanalysis/Screens/authScreens/SignIn.dart';

class authentication_methods {
  static Future<String> SignupUsers(
      {
      required String email,
      required String password}) async {
    email.trim();
    password.trim();
    String output;
    if (email != "" &&  password != "") {
      try {
        final authResult =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        output = "SignUp Successfully";

      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill all the fields";
    }
    print("output is $output");
    return output;
  }

  //SignIn method
  static Future<String> SignInUsers(
      {required String email, required String password}) async {
    email.trim();
    password.trim();
    String output;
    if (email != "" && password != "") {
      try {
        final authResult =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        output = "SignIn Successfully";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill all the fields";
    }

    return output;
  }

 static hndleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return SignIn();
          }
        });
  }
}
