
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
      width: 102,
      height: 115,
      decoration: BoxDecoration(
          color: color,
          //border: Border.all(width: 10,color: Colors.red[300],),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //  SvgPicture.asset(url!),
          Image.asset(url!),
          SizedBox(
            height: 13.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              text!,
              style: TextStyle(
                fontSize: 20.sp,
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
