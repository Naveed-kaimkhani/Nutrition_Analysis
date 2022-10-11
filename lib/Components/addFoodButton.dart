
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
        // () async {
          // if (NameController.text != null &&
          //     caloreisController.text != null &&
          //     carbController.text != null &&
          //     ServingController.text != null) {
          //   () async {
          //     _model.calories =
          //         (double.parse(caloreisController.text) *
          //             double.parse(ServingController.text));
          //     _model.carb =
          //         (double.parse(carbController.text) *
          //             double.parse(ServingController.text));
          //     String ti = _Nutrients.titless.toString();
          //     List<String> lot = ti.split(',');
          //     lot.add(NameController.text);
          //     _model.titles = lot;
          //     await _Nutrients.addNutrition(
          //         nutrients: _model);
          //     _Nutrients.getNutrients();
          //     Fluttertoast.showToast(
          //         msg: "${NameController.text} added");
          //   };
          // }
          // Fluttertoast.showToast(
          //     msg: "Please fill all the fields");
        // },
      ),
    );
  }
}