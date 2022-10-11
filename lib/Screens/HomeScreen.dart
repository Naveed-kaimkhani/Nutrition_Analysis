import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Components/Button.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';
import 'package:nutritionanalysis/Screens/NoUserFound.dart';
import 'package:nutritionanalysis/Screens/SearchRecipes.dart';
import 'package:nutritionanalysis/Screens/Search_By_Recipes.dart';
import 'package:nutritionanalysis/Services/NutrientsController.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Components/TodayListWidget.dart';
import '../Services/UpdateData.dart';
import 'RecipeScreen.dart';
import 'TabBarScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _Nutrients = Get.put(NutrientsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("in home page init state");
    // print("init of homepage");
    //  UpdateData.UpdateValues();
    _Nutrients.getNutrients();
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
                        icon: Image.asset('lib/asset/NavigationIcon.png'),
                      )),
              actions: [CircleAvatar(child: Image.asset('lib/asset/man.png'))],
              elevation: 0,
              title: Text("Good Morning, John!",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    //  fontFamily: 'Inter',
                    fontSize: 30.sp,
                    color: Colors.black,
                  )),
              backgroundColor: globalVariables.backgroundColor,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 35.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Today's Goal",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 30),
                          child: CircularPercentIndicator(
                            radius: 70,
                            lineWidth: 12,
                            percent: 0.8,
                            progressColor: Color(0xffE56750),
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor: Color(0xffFFE7CF),
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Text(
                                  "1100",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                new Text(
                                  "Calories",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            animation: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 30),
                          child: CircularPercentIndicator(
                            radius: 60,
                            lineWidth: 12,
                            percent: 0.8,
                            // strokeWidth: 5,

                            progressColor: Color(0xffF3AD69),
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor: Color(0xffFFE7CF),
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Text(
                                  "1100",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                new Text(
                                  "Carbs",
                                  style: TextStyle(
                                      fontSize: 16,
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
                    const Text(
                      "Keep doing great",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
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
                    const Text(
                      "Today's Food",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Dismissible(
                              key: Key(index.toString()),
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
                                child: const Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                ),
                              ),
                              //child: TodayListWidget(),
                              child: Container(),
                              onDismissed: (direction) {},
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            drawer: Drawer(
              backgroundColor: Colors.black,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Text(
                      'Navigation Drawer',
                      style: TextStyle(fontSize: 20),
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
    return Container(
      // padding: EdgeInsets.only(left: 10, top: 10),
      margin: EdgeInsets.only(left: 10, top: 10),
      width: 159,
      height: 206,
      decoration: BoxDecoration(
          color: Color(0xff351F2B),
          //border: Border.all(width: 10,color: Colors.red[300],),
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 26.h),
            child: Text(
              "Find Recipes",
              style: TextStyle(
                fontSize: 20,
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
    );
  }
}

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 10, top: 10),
      margin: const EdgeInsets.only(left: 10, top: 10),
      width: 159,
      height: 206,
      decoration: BoxDecoration(
          color: const Color(0xffE56750),
          //border: Border.all(width: 10,color: Colors.red[300],),
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 26.h),
            child: Text(
              "Add New Item",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 49.w),
            child: Image.asset(
              'lib/asset/list.png',
              height: 110.h,
              width: 110.w,
            ),
          ),
        ],
      ),
    );
  }
}
