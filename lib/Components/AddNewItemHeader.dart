import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewItemHeader extends StatelessWidget {
  const AddNewItemHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 137.h,
      width: 337.w,
      decoration: BoxDecoration(
          color: Color(0xffE56750),
          //border: Border.all(width: 10,color: Colors.red[300],),
          borderRadius: BorderRadius.circular(20.r)),
      child: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text("Add New\nItem",
              style: TextStyle(
                fontSize: 28.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              )),
          Image.asset('lib/asset/list.png', height: 103.h, width: 103.w),
          // Image.asset("lib/asset/list.png"),
        ]),
      ),
    );
  }
}
