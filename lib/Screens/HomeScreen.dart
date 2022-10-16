import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Components/Button.dart';
import 'package:nutritionanalysis/Components/homeFoodList.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';
import 'package:nutritionanalysis/Screens/NoUserFound.dart';
import 'package:nutritionanalysis/Screens/SearchRecipes.dart';
import 'package:nutritionanalysis/Screens/Search_By_Recipes.dart';
import 'package:nutritionanalysis/Screens/restrict_to_apicalls.dart';
import 'package:nutritionanalysis/Services/DbHelper.dart';
import 'package:nutritionanalysis/Services/NutrientsController.dart';
import 'package:nutritionanalysis/model/TodaysListFoodModel.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Components/TodayListWidget.dart';
import '../Services/UpdateData.dart';
import 'RecipeScreen.dart';
import 'TabBarScreen.dart';

var _Nutrients = Get.put(NutrientsController());

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// List<TodaysListFoodModel>? todaylist;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("in home page init state");
    // print("init of homepage");
    //  UpdateData.UpdateValues();
    _Nutrients.getNutrients();
    // _Nutrients.getAvailableCalls();

    // getRemainingCalls();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return false
        ? SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height / 2,
                      width: size.width,
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 40.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GetBuilder<NutrientsController>(
                                builder: (controller) {
                              return Text(
                                // _Nutrients.carbs
                                // "Carbs: ${double.parse(controller.carbss).round()}",
                                "Carbs: ${controller.carbss}",

                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            GetBuilder<NutrientsController>(
                                builder: (controller) {
                              return Text(
                                // _Nutrients.carbs
                                "Calories: ${controller.caloriess}",

                                //"Calories: ${double.parse(controller.caloriess).round().toString()}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 120.0),
                              child: Button(
                                  function: () {
                                    Get.to(() => TabBarScreen());
                                  },
                                  text: "Add new Item"),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 6.0, left: 120.0),
                            //   child: Button(
                            //       function: () {
                            //         UpdateData.UpdateValues();
                            //         _Nutrients.getNutrients();
                            //       },
                            //       text: "Reset Counter"),
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 120.0),
                              child: Button(
                                  function: () async {
                                    //await  FirebaseAuth.instance.signOut();
                                    User? user =
                                        FirebaseAuth.instance.currentUser;

                                    if (user == null) {
                                      Get.to(() => NoUserFound());
                                    } else {
                                      Get.to(() => SearchRecipes());
                                    }
                                    //      Get.to(() => TabBarScreen());
                                  },
                                  text: "Search Recipes"),
                            ),
                            const SizedBox(
                              height: 38,
                            ),
                            const Text(
                              "Today's Food",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        height: size.height / 2,
                        width: size.width,
                        color: Color.fromARGB(255, 198, 191, 191),
                        child: _Nutrients.titless != null
                            ? GetBuilder<NutrientsController>(
                                builder: (controller) {
                                return ListView.builder(
                                    itemCount: _Nutrients.titless.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 50,
                                        width: 50,
                                        //   color: Colors.grey,
                                        child: Card(
                                          color: Colors.grey,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                Text(_Nutrients.titless[index]),
                                            // child: GetBuilder<NutrientsController>(
                                            //     builder: (controller) {
                                            //   return Text(
                                            //     // _Nutrients.carbs
                                            //     _Nutrients.titless[index],
                                            //   );
                                            // }),
                                          ),
                                        ),
                                      );
                                    });
                              })
                            : Center(
                                child: Text("Nothing to show"),
                              ))
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: globalVariables.backgroundColor,
            appBar: AppBar(
              leading: Builder(
                  builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Image.asset(
                          'lib/asset/NavigationIcon.png',
                          height: 60.h,
                          width: 390.w,
                        ),
                      )),
              actions: [
                CircleAvatar(
                    child: Image.asset(
                  'lib/asset/man.png',
                  height: 43.h,
                  width: 33.w,
                ))
              ],
              elevation: 0,
              title: Text("Good Morning, John!",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    //  fontFamily: 'Inter',
                    fontSize: 22.sp,
                    color: Colors.black,
                  )),
              backgroundColor: globalVariables.backgroundColor,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 35.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today's Goal",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                          ),
                        ),

                        // FutureBuilder(
                        //     future: UpdateData.getAvailableCalls(),
                        //     builder: (ctx, AsyncSnapshot<int?> snapshot) {
                        //       // Checking if future is resolved

                        //       // If we got an error
                        //       if (snapshot.hasError) {
                        //         return Center(
                        //           child: Text(
                        //             '${snapshot.error} occurred',
                        //             style: TextStyle(fontSize: 18),
                        //           ),
                        //         );

                        //         // if we got our data
                        //       } else {
                        //         print(snapshot.data);
                        //         // Extracting data from snapshot object
                        //         final data = snapshot.data;
                        //         return Center(
                        //           child: Text(
                        //             'Remaining Calls: $data',
                        //             style: TextStyle(fontSize: 18),
                        //           ),
                        //         );
                        //       }
                        //     }),

                        GetBuilder<NutrientsController>(builder: (controller) {
                          return Text(
                            // _Nutrients.carbs
                            // "Carbs: ${double.parse(controller.carbss).round()}",
                            "Remaining Calls: ${controller.apiCalls}",

                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30.w, top: 30.h),
                          child: CircularPercentIndicator(
                            radius: 70.r,
                            lineWidth: 12,
                            percent: 0.8,
                            progressColor: Color(0xffE56750),
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor: Color(0xffFFE7CF),
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // new Text(
                                //   "1100",
                                //   style: TextStyle(
                                //       fontSize: 16,
                                //       fontWeight: FontWeight.w700),
                                // ),
                                GetBuilder<NutrientsController>(
                                    builder: (controller) {
                                  return Text(
                                    // _Nutrients.carbs
                                    "${controller.caloriess}",

                                    //"Calories: ${double.parse(controller.caloriess).round().toString()}",
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }),
                                new Text(
                                  "Calories",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            animation: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.w, top: 30.h),
                          child: CircularPercentIndicator(
                            radius: 60.r,
                            lineWidth: 12,
                            percent: 0.8,
                            // strokeWidth: 5,

                            progressColor: Color(0xffF3AD69),
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor: Color(0xffFFE7CF),
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GetBuilder<NutrientsController>(
                                    builder: (controller) {
                                  return Text(
                                    // _Nutrients.carbs
                                    "${controller.carbss}",

                                    //"Calories: ${double.parse(controller.caloriess).round().toString()}",
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }),
                                new Text(
                                  "Carbs",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            animation: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 29.h,
                    ),
                    Text(
                      "Keep doing great",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        fontFamily: 'Inter',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: AddItemButton(),
                          onTap: () => Get.to(() => Search_By_Recipes()),
                        ),
                        GestureDetector(
                          child: SearchRecipeButton(),
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "Today's Food",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GetBuilder<NutrientsController>(builder: (controller) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.todayList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Dismissible(
                                key: Key( controller.todayList[index].id.toString()),
                                background: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red,
                                  ),
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                secondaryBackground: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 12.w),
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),

                                // child: Container(),
                                direction: DismissDirection.endToStart,

                                onDismissed: (direction) async{
                                  print(_Nutrients.todayList[index]);
                               await   DbHelper.removeValues(
                                       controller.todayList[index].calories!,
                                       controller.todayList[index].carb!);
                                       setState(() {
                                            controller.todayList.remove(controller.todayList[index]);
                          });
                                      // controller.updateTodayList( controller.todayList[index]);

                                      
                                },
                                child: homeFoodList(
                                    recipe: _Nutrients.todayList[index]),
                              ),
                            );
                          });
                    })
                  ],
                ),
              ),
            ),
            drawer: Drawer(
              backgroundColor: Colors.black,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Text(
                      'Navigation Drawer',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: const Text(' My Profile '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
  }
}

class SearchRecipeButton extends StatelessWidget {
  const SearchRecipeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          // padding: EdgeInsets.only(left: 10, top: 10),
          margin: EdgeInsets.only(left: 10.w, top: 10.h),
          width: 159.w,
          height: 206.h,
          decoration: BoxDecoration(
              color: Color(0xff351F2B),
              //border: Border.all(width: 10,color: Colors.red[300],),
              borderRadius: BorderRadius.circular(18.r)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 26.h),
                child: Text(
                  "Find Recipes",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 49.w, top: 5.h),
                child: Image.asset(
                  'lib/asset/recipe.png',
                  height: 110.h,
                  width: 110.w,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Get.to(() => SearchRecipes());
        });
  }
}

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        // padding: EdgeInsets.only(left: 10, top: 10),
        margin: EdgeInsets.only(left: 10.w, top: 10.h),
        width: 159.w,
        height: 206.h,
        decoration: BoxDecoration(
            color: const Color(0xffE56750),
            //border: Border.all(width: 10,color: Colors.red[300],),
            borderRadius: BorderRadius.circular(18.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
              child: Text(
                "Add New Item",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 49.w),
              child: Image.asset(
                'lib/asset/list.png',
                height: 136.h,
                width: 136.w,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        _Nutrients.apiCalls >= 1
            ? Get.to(() => Search_By_Recipes())
            : Get.to(() => restrict_to_apicalls());
      },
    );
  }
}
