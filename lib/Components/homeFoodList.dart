import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../model/Response_Model.dart';
import '../model/TodaysListFoodModel.dart';

class homeFoodList extends StatelessWidget {
  final TodaysListFoodModel recipe;
  // final int index;
  const homeFoodList({
    required this.recipe,
    // required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String calorie = recipe.calories.toString();
    return Container(
        // margin: EdgeInsets.all(2.0),
        height: 136.h,
        width: 362.w,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          //border: Border.all(width: 10,color: Colors.red[300],),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), //color of shadow
              spreadRadius: 1, //spread radius
              blurRadius: 5, // blur radius
              offset: const Offset(
                5.0,
                5.0,
              ), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
            //you can set more BoxShadow() here
          ],
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 20.h),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(110.r),
                child: Image.network(
                  recipe.image!,
                  height: 71.h,
                  width: 69.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.title!.substring(0, 12),
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "Quantity: 1 Serving",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        ' Calories:  ${recipe.calories!.round()}\n Carbs:      ${recipe.carb!.round()}\n Protein:    ${recipe.protein!.round()}\n  Fat:           ${recipe.protein!.round()} ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 50.w,
              ),
              CircularPercentIndicator(
                radius: 45,
                lineWidth: 10,
                percent: 0.5,
                // strokeWidth: 5,

                progressColor: Color(0xffF3AD69),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Color(0xffFFE7CF),
                center: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text(
                      recipe.calories!.round().toString(),
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w700),
                    ),
                    new Text(
                      "Calories",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                animation: true,
              ),
            ])));
  }
}
