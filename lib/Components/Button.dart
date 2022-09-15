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
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 60,
        width: 150,
        color: Colors.black,
        child: Center(
          child: Text(
            text!,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
