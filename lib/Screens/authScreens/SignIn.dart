import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Screens/HomeScreen.dart';
import 'package:nutritionanalysis/Services/authentication_methods.dart';

import '../../Components/Button.dart';
import '../../Components/inputfields.dart';

class SignIn extends StatelessWidget {
   SignIn({Key? key}) : super(key: key);
TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
   SizedBox k = SizedBox(
      height: 40,
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
         children: [
          Text("SignIn"),
          k,
             inputfields(
                  hint_text: "Enter Email", controller: emailController),
                  k,
                      inputfields(
                  hint_text: "Enter Password", controller: passwordController),
              k,
                Button(
                            function: () async{
                             
                        String output= await authentication_methods.SignInUsers(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            
                          if (output=="SignIn Successfully") {
                             Get.to(() => HomeScreen());
                          }
                          else{
                            Get.snackbar("Authentication Response",output);
                          }
                            },
                            text: "SignIn"),
         ], ),
      ),
    );
  }
}