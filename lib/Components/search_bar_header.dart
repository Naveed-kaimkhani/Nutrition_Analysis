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
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
      height: 236.h,
      width: 365.w,
      decoration: BoxDecoration(
        color: globalVariables.greyColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 37.h),
                child: Text(
                  "Find Keto\n Recipes",
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                child: Image.asset(
                  'lib/asset/recipebook.png',
                  height: 103.h,
                  width: 103.w,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SearchBarWidget(isReadOnly: true, hasBackButton: false),
              
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                height: 41.h,
                width: 41.w,
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
