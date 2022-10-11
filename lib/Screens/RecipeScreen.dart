import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';
import 'package:nutritionanalysis/model/RecipePageInfo.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Components/recipelables.dart';
import '../Services/Api_Services.dart';
import '../model/RecipeInfo.dart';

class RecipeScreen extends StatelessWidget {
  int? id;
  RecipeScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return false
        ? SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
              child: FutureBuilder(
                  future: Api_Services.getRecipeInform(id: id),
                  builder: (context, AsyncSnapshot<RecipePageInfo> snapshot) {
                    if (snapshot.hasData) {
                      // print(snapshot.data!.length);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(snapshot.data!.image!),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 8.0),
                              child: Text(
                                snapshot.data!.title!,
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          // Text(snapshot.data!.title!),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //MainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Prep Time: \n   ${snapshot.data!.readyInMinutes!} mins",
                                  style: TextStyle(fontSize: 15),
                                ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                Text(
                                  "Servings: \n       ${snapshot.data!.servings}",
                                  style: TextStyle(fontSize: 15),
                                ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                Text(
                                  "Calories: \n  ${snapshot.data!.nutrition!.nutrients![0].amount}",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, top: 12.0),
                            child: Text("Ingredients",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            // color: Colors.black,
                            margin: EdgeInsets.only(top: 6, left: 4),
                            height: size.height / 3,
                            width: size.width,
                            child: ListView.builder(
                                itemCount:
                                    snapshot.data!.extendedIngredients!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, left: 6),
                                    child: Row(
                                      children: [
                                        // Image.network(snapshot.data!
                                        //     .extendedIngredients![index].image!),
                                        Text(
                                          "${snapshot.data!.extendedIngredients![index].name!}  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        // SizedBox(
                                        //   width: 10,
                                        // ),
                                        Text(
                                          "${snapshot.data!.extendedIngredients![index].amount!.toString()} ",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(snapshot.data!
                                            .extendedIngredients![index].unit!
                                            .toString())
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, top: 12.0),
                            child: Text("Instructions",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0, left: 6),
                            child: Text(
                              RemoveHtmlTags(snapshot.data!.instructions!),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, top: 12.0),
                            child: Text("Summary",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0, left: 6),
                            child: Text(
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              RemoveHtmlTags(snapshot.data!.summary!),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            )),
          )
        : SafeArea(
            child: Scaffold(
                backgroundColor: globalVariables.backgroundColor,
                extendBodyBehindAppBar: true,
                // appBar: AppBar(
                //   backgroundColor: Colors.transparent,
                //   elevation: 0,
                //   leading: IconButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     icon: Padding(
                //       padding: const EdgeInsets.all(3.0),
                //       child: Image.asset('lib/asset/back 1.png'),
                //     ),
                //   ),
                // ),
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
                                          fontSize: 35.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("  Number of servings",
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.black)),
                                        Text(
                                            snapshot.data!.servings.toString()),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(16.0),
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [],
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // // Text("fdfdfd"),`
                              // const Divider(
                              //   thickness: 7.0,
                              //   color: Color.fromARGB(255, 239, 232, 232),
                              //   //  indent: 16,
                              //   //endIndent: 16,
                              // ),
                              Recipelables(
                                title: "Ingredients",
                              ),

                              //Text("hahahh"),
                              ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: snapshot
                                      .data!.extendedIngredients!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 6.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        // //crossAxisAlignment:
                                        // //CrossAxisAlignment.start,
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              color: globalVariables.greyColor,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          // Image.network(snapshot.data!
                                          //     .extendedIngredients![index].image!),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            "${snapshot.data!.extendedIngredients![index].name!}  ",
                                            style: TextStyle(
                                              fontSize: 20,
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 40.w,
                                          // ),
                                          Spacer(),
                                          Text(
                                            "${snapshot.data!.extendedIngredients![index].amount!.toString()} ${snapshot.data!.extendedIngredients![index].unit!.toString()}",
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // Text(snapshot
                                          //     .data!
                                          //     .extendedIngredients![index]
                                          //     .unit!
                                          //     .toString())
                                        ],
                                      ),
                                    );
                                  }),
                              // const Divider(
                              //   thickness: 7.0,
                              //   color: Color.fromARGB(255, 239, 232, 232),
                              //   //  indent: 16,
                              //   //endIndent: 16,
                              // ),
                              Recipelables(title: "Instructions"),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, top: 6, right: 6, bottom: 6),
                                child: Text(
                                  RemoveHtmlTags(
                                    snapshot.data!.instructions!,
                                  ),
                                  // maxLines: 4,
                                  //overflow: TextOverflow.ellipsis,
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

// // var doc = parse(htmlTags);
// if(doc.documentElement != null){
//     String parsedstring = doc.documentElement!.text;
//   }
    return parsedstring;
  }
}
