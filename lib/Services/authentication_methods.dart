import 'package:firebase_auth/firebase_auth.dart';

class authentication_methods {
  static Future<String> SignupUsers(
      {
        //required String namee,
      required String email,
      //required String phonee,
      required String password}) async {
    //namee.trim();
    email.trim();
    //phonee.trim();
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
        // await Firestore_method.uploadDataToFirestore(
        //     name: namee, phone: phonee);
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill all the fields";
      // return output;
    }
    print("output is $output");
    // return output as Future<String>;
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
      // return output;
    }
    //print("output is $output");
    // return output as Future<String>;
    return output;
  }
}
