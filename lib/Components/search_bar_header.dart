
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';

import 'SearchBarWidget.dart';

class search_bar_header extends StatelessWidget {
  const search_bar_header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 17.w, vertical: 14.h),
      height: 260.h,
      width: 385.w,
      decoration: BoxDecoration(
        color: globalVariables.greyColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 37.h),
                child: Text(
                  "Find Keto  Recipes",
                  style: TextStyle(
                    fontSize: 40.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25.h),
                child: Image.asset(
                  'lib/asset/recipebook.png',
                  // height: 120,
                  // width: 120,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SearchBarWidget(isReadOnly: true, hasBackButton: false),
              // Container(
              //   height: 55.h,
              //   width: 270.w,
              //   //  color: Colors.white,
              //   decoration: BoxDecoration(
              //       color: const Color(0xffFFFFFF),
              //       border: Border.all(
              //         color:
              //             const Color.fromARGB(255, 248, 202, 183),
              //         width: 2,
              //       ),
              //       borderRadius: BorderRadius.circular(10.r)),
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                height: 55.h,
                width: 55.w,
                decoration: BoxDecoration(
                  color: const Color(0xffF3AD69),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Image.asset('lib/asset/search.png'),
              )
            ],
          )
        ],
      ),
    );
  }
}
