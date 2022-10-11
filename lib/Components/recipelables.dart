
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';

class Recipelables extends StatelessWidget {
String? title;
 Recipelables({
   required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 30.h,
      width: 140.w,
      decoration: BoxDecoration(
          color: globalVariables.greyColor,
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(title!,
            style: TextStyle(
                fontSize: 22.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
