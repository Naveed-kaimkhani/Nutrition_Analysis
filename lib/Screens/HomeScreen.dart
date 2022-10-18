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
import 'package:percent_indicator/circular_percent_indicator.dart';

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
    _Nutrients.getNutrients();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                  GetBuilder<NutrientsController>(builder: (controller) {
                    return Text(
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
                      percent: 0.5,
                      progressColor: Color(0xffE56750),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Color(0xffFFE7CF),
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GetBuilder<NutrientsController>(
                              builder: (controller) {
                            return Text(
                              "${controller.caloriess}",
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                          Text(
                            "Calories",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w400),
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
                      percent: 0.5,
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
                              "${controller.carbss}",
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                          Text(
                            "Carbs",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w400),
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
                return controller.todayList.length >= 1
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.todayList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Dismissible(
                              // key: Key( index.toString()),
                              key: UniqueKey(),
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

                              onDismissed: (direction) async {
                                print(_Nutrients.todayList[index]);
                                setState(() {
                                  controller.todayList.removeAt(index);
                                });
                                await DbHelper.removeValues(
                                    controller.todayList[index].calories!,
                                    controller.todayList[index].carb!);
                              },
                              child: homeFoodList(
                                  recipe: _Nutrients.todayList[index]),
                            ),
                          );
                        })
                    : Container();
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
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
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
                  height: 120.h,
                  width: 120.w,
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
        margin: EdgeInsets.only(left: 10.w, top: 10.h),
        width: 159.w,
        height: 206.h,
        decoration: BoxDecoration(
            color: const Color(0xffE56750),
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
            ? Get.to(() => const Search_By_Recipes())
            : Get.to(() => const restrict_to_apicalls());
      },
    );
  }
}
