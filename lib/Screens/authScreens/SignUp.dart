import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Screens/HomeScreen.dart';
import 'package:nutritionanalysis/Screens/authScreens/SignIn.dart';
import 'package:nutritionanalysis/Services/authentication_methods.dart';
import '../../Components/Button.dart';
import '../../Components/inputfields.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isLoading=false;

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
              Text("SignUp",
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
                      isLoading=true;
                    });
                    String output = await
                        //  authentication_methods.SignupUsers(email: email, password: password)
                        await authentication_methods.SignupUsers(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    setState(() {
                      isLoading=false;
                    });
                    Get.snackbar("Authentication Response", output,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  text:isLoading?"Please Wait..":"SignUp"),
              k,
              Padding(
                padding: const EdgeInsets.only(left: 250.0),
                child: Button(
                    function: () {
                      Get.to(() => SignIn());
                    },
                    text: "Go to login page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
