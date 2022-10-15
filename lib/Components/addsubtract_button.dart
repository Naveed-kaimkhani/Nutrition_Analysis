import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';

class addsubtract_button extends StatelessWidget {
  IconData? icon;
  Function()? func;
  addsubtract_button({
    Key? key,
    required this.icon,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 48.h,
        width: 40.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: globalVariables.tapedButtonColor,
        ),
        child: Center(
            child: IconButton(
                onPressed: func,
                icon: Icon(
                  icon,
                  color: Colors.white,
                ))),
      ),
    );
  }
}
