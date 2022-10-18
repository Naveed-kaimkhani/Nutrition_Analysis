import 'package:flutter/material.dart';
class NoUserFound extends StatelessWidget {
  const NoUserFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Login to use this feature")),
    );
  }
}