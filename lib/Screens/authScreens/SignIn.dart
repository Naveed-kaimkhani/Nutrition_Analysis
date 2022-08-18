import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Screens/HomeScreen.dart';
import 'package:nutritionanalysis/Services/UpdateData.dart';
import 'package:nutritionanalysis/Services/authentication_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/Button.dart';
import '../../Components/inputfields.dart';
import 'SignUp.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//  SharedPreferences prefs = await SharedPreferences.getInstance();


  bool isLoading = false;

  SizedBox k = SizedBox(
    height: 40,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              k,
              k,
              Padding(
                padding: const EdgeInsets.only(left: 250.0),
                child: Button(
                    function: () {
                      Get.to(() => HomeScreen());
                    },
                    text: "Use Unpaid Version"),
              ),
              Text("SignIn",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              k,
              inputfields(
                  hint_text: "Enter Email", controller: emailController),
              k,
              inputfields(
                  hint_text: "Enter Password", controller: passwordController),
              k,
              Button(
                  function: () async {
                    setState(() {
                      isLoading = true;
                    });
                    String output = await authentication_methods.SignInUsers(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    setState(() {
                      isLoading = false;
                    });
                    if (output == "SignIn Successfully") {
                       SharedPreferences prefs = await SharedPreferences.getInstance();
                      UpdateData.SetDate();
                      Get.to(() => HomeScreen());
                    } else {
                      Get.snackbar(
                        "Authentication Response",
                        output,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  text: isLoading ? "Please Wait..." : "SignIn"),
              k,
              k,
              Button(
                  function: () {
                    Get.to(() => SignUp());
                  },
                  text: "Dont have an account?? SignUp"),
            ],
          ),
        ),
      ),
    );
  }
}
