import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewRecipeTab extends StatelessWidget {
  final Color? color;
  final String? url;
  final String? text;

  const AddNewRecipeTab({
    Key? key,
    required this.color,
    required this.url,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 102.w,
      height: 115.h,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            url!,
            height: 35.h,
            width: 35.w,
          ),
          SizedBox(
            height: 13.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              text!,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
