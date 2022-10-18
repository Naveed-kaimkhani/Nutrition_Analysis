import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class inputfields extends StatelessWidget {
  String? hint_text;
  TextEditingController? controller;
  inputfields({
    required this.hint_text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 55.h,
      width: 326.w,
      //  color: Colors.white,
      decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          border: Border.all(
            color: Color.fromARGB(255, 248, 202, 183),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.r)),
      // ignore: prefer_const_constructors
      child: TextField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint_text,
          hintStyle: TextStyle(
            color: Color(0xffFFD2BF),
            fontSize: 20.sp,
          ),
        ),
      ),
    );
  }
}
