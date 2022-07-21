
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String? text;
  final Function()? function;

  const Button({
    Key? key,
    required this.function,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 100,
        color: Colors.black,
        child: GestureDetector(
          onTap: function,
          child: Center(
            child: Text(
              text!,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ));
  }
}
