
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addFoodButton extends StatelessWidget {
  String? text;
  Function()? func;
  addFoodButton({
   required this.text,
   required this.func,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 106.w, top: 60.h),
      child: GestureDetector(
        child: Container(
          height: 54.h,
          width: 118.w,
          decoration: BoxDecoration(
              color: const Color(0xffE56750),
              //border: Border.all(width: 10,color: Colors.red[300],),
              borderRadius: BorderRadius.circular(5.r)),
          child: Center(
            child: Text(
              text!,
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
        onTap:func, 
      
      ),
    );
  }
}