import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Screens/Search_Screen.dart';

import '../Screens/Result_Screen.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;
  SearchBarWidget({
    Key? key,
    required this.isReadOnly,
    required this.hasBackButton,
  })  : preferredSize = const Size.fromHeight(80),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 41.h,
      width: 270.w,
      //  color: Colors.white,
      decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          border: Border.all(
            color: const Color.fromARGB(255, 248, 202, 183),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          hasBackButton
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.red,
                    size: 30,
                  ))
              : Container(),
          SizedBox(
            height: 30.h,
            width: 250.w,
            child: TextField(
              decoration: InputDecoration(
                //labelText: 'Enter item name here',
                hintText: ' Enter item name here',
                hintStyle: TextStyle(
                  color: const Color(0xffFFD2BF),
                  fontSize: 20.sp,
                ),
                border: InputBorder.none,
              
              ),
              onSubmitted: (String query) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(query: query)));
              },
              readOnly: isReadOnly,
              onTap: () {
                if (isReadOnly) {
                  Get.to(() => Search_Screen());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
