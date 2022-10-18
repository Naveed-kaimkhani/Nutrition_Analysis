import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';
import 'package:nutritionanalysis/model/RecipePageInfo.dart';

import '../Components/recipelables.dart';
import '../Services/Api_Services.dart';

class RecipeScreen extends StatelessWidget {
  int? id;
  RecipeScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: globalVariables.backgroundColor,
          extendBodyBehindAppBar: true,
          body: FutureBuilder(
              future: Api_Services.getRecipeInform(id: id),
              builder: (context, AsyncSnapshot<RecipePageInfo> snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Image.asset(
                                    'lib/asset/back 1.png',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Image.network(
                              snapshot.data!.image!,
                              width: size.width,
                              height: size.height / 4,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 20.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.title!,
                                style: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RecipeScreenRowLable(
                              icon: Icons.watch_later_outlined,
                              title:
                                  "Prepared time      \n ${snapshot.data!.readyInMinutes!} Mins",
                            ),
                            RecipeScreenRowLable(
                              icon: Icons.no_meals_outlined,
                              title:
                                  "Calories: \n  ${snapshot.data!.nutrition!.nutrients![0].amount!.round()}",
                            ),
                            RecipeScreenRowLable(
                              icon: Icons.food_bank_outlined,
                              title:
                                  "Servings: \n       ${snapshot.data!.servings}",
                            ),
                          ],
                        ),

                        Recipelables(
                          title: "Ingredients",
                        ),

                        //Text("hahahh"),
                        ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount:
                                snapshot.data!.extendedIngredients!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 6.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: globalVariables.greyColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "${snapshot.data!.extendedIngredients![index].name!}  ",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "${snapshot.data!.extendedIngredients![index].amount!.toString()} ${snapshot.data!.extendedIngredients![index].unit!.toString()}",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              );
                            }),

                        Recipelables(title: "Instructions"),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 6, right: 6, bottom: 6),
                          child: Text(
                            RemoveHtmlTags(
                              snapshot.data!.instructions!,
                            ),
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        Recipelables(title: "Summary"),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 8, right: 6, bottom: 6),
                          child: Text(
                            RemoveHtmlTags(
                              snapshot.data!.summary!,
                            ),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              })),
    );
  }

  String RemoveHtmlTags(String htmlTags) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    String parsedstring = htmlTags.replaceAll(exp, ' ');

    return parsedstring;
  }
}

class RecipeScreenRowLable extends StatelessWidget {
  String? title;
  IconData? icon;
  RecipeScreenRowLable({
    this.title,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.h,
      width: 85.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Color(0xffF3AD69),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 22,
          ),
          Text(
            title!,
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}
