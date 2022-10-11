import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Screens/HomeScreen.dart';
import 'package:nutritionanalysis/Screens/OwnNutrients.dart';
import 'package:nutritionanalysis/model/Food_Item.dart';
import 'package:nutritionanalysis/model/Food_info.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';

import '../Components/AddNewItemHeader.dart';
import '../Components/Button.dart';
import '../Components/addFoodButton.dart';
import '../Components/addsubtract_button.dart';
import '../Components/inputfields.dart';
import '../Services/Api_Services.dart';
import '../Services/NutrientsController.dart';
import '../Components/AddNewRecipeTab.dart';
import '../model/NutrientsModel.dart';
import 'Search_By_Recipes.dart';

int serving = 1;

class Search_by_foodItem extends StatefulWidget {
  const Search_by_foodItem({Key? key}) : super(key: key);

  @override
  State<Search_by_foodItem> createState() => _Search_by_foodItemState();
}

class _Search_by_foodItemState extends State<Search_by_foodItem> {
  //double? carbs;
  // double? protein;
  //double? fats;
  //List<String>? ListOfTodaysFood;
  var _Nutrients = Get.put(NutrientsController());
  TextEditingController qController = new TextEditingController()..text = '1';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NutrientsModel _model = NutrientsModel(calories: 0, carb: 0, titles: [""]);
    //  const svg = 'lib/asset/back.svg';
    return false
        ? Scaffold(
            backgroundColor: Colors.grey,
            body: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Search by food",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                  child: Text(
                    "Add",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Enter Servings",
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                inputfields(
                  hint_text: "Enter Servings",
                  controller: qController,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: 250,
                  color: Colors.white,
                  child: TypeAheadField<FoodResults>(
                    textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                      labelText: 'Enter Food',
                      //   border: OutlineInputBorder(),
                    )),
                    suggestionsCallback: (pattern) =>
                        Api_Services.getFoodSuggestion(query: pattern),
                    itemBuilder: (context, FoodResults suggestion) {
                      final meal = suggestion;
                      return ListTile(
                        title: Card(child: Text(meal.name!)),
                      );
                    },
                    onSuggestionSelected: (FoodResults suggestion) async {
                      //this function will execute when user clicks on suggested meal
                      int? id = suggestion.id;
                      List<FoodNutrients> nutrnts =
                          await Api_Services.getFoodNutrition(id: id);
                      //(nutrnts[18].amount * int.parse(qController.text));
                      _model.calories =
                          (nutrnts[18].amount! * int.parse(qController.text));
                      _model.carb =
                          (nutrnts[6].amount! * int.parse(qController.text));
                      print(nutrnts[6].amount!);
                      print("erorrrr");
                      print((nutrnts[6].amount! * int.parse(qController.text)));
                      // print("food calories${_model.calories}");
                      // print("food calories${_model.carb}");
                      // print("list of titles in fooditem");
                      // print(_Nutrients.titless);
                      String ti = _Nutrients.titless.toString();
                      List<String> lot = ti.split(',');
                      lot.add(suggestion.name!);
                      //print("models title${_model.titles}");
                      _model.titles = lot;
                      //  print(_model.titles);
                      //    print("before add Nutrition");
                      await _Nutrients.addNutrition(nutrients: _model);
                      Fluttertoast.showToast(msg: "${suggestion.name} added");
                      _Nutrients.getNutrients();
                    },
                    noItemsFoundBuilder: (context) => const Center(
                      child: Text("No Meal Found"),
                    ),
                    debounceDuration: const Duration(milliseconds: 20),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: globalVariables.backgroundColor,
            appBar: CustomAppBar(),
            body: SingleChildScrollView(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                  child: Column(children: [
                    const AddNewItemHeader(),
                    SizedBox(
                      height: 13.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: const AddNewRecipeTab(
                            text: "Add New\nRecipe",
                            color: Color(0xffFFE8D2),
                            url: 'lib/asset/recipee.png',
                          ),
                          onTap: () => Get.to(() => Search_By_Recipes()),
                        ),
                        const AddNewRecipeTab(
                          text: "Add New\nFood",
                          color: Color(0xffF3AD69),
                          url: 'lib/asset/food.png',
                        ),
                        GestureDetector(
                            child: const AddNewRecipeTab(
                              text: "Add Custom Food",
                              color: Color(0xffFFE8D2),
                              url: 'lib/asset/plus.png',
                            ),
                            onTap: () => Get.to(() => OwnNutrients()))
                      ],
                    ),
                    // SizedBox(
                    //   height: 43.h,
                    // ),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      height: 70.h,
                      width: 326.w,
                      //  color: Colors.white,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          border: Border.all(
                            color: Color.fromARGB(255, 248, 202, 183),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: TypeAheadField<FoodResults>(
                        textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                          hintText: ' Enter food name here',
                          hintStyle: TextStyle(
                            color: Color(0xffFFD2BF),
                            fontSize: 20.sp,
                          ),
                          border: InputBorder.none,
                          //   border: OutlineInputBorder(),
                        )),
                        suggestionsCallback: (pattern) =>
                            Api_Services.getFoodSuggestion(query: pattern),
                        itemBuilder: (context, FoodResults suggestion) {
                          final meal = suggestion;
                          return ListTile(
                            title: Card(child: Text(meal.name!)),
                          );
                        },
                        onSuggestionSelected: (FoodResults suggestion) async {
                          //this function will execute when user clicks on suggested meal
                          int? id = suggestion.id;
                          List<FoodNutrients> nutrnts =
                              await Api_Services.getFoodNutrition(id: id);
                          //(nutrnts[18].amount * int.parse(qController.text));
                          _model.calories = (nutrnts[18].amount! *
                              int.parse(qController.text));
                          _model.carb = (nutrnts[6].amount! *
                              int.parse(qController.text));
                          //print(nutrnts[6].amount!);
                          //  print("erorrrr");
                          //print((nutrnts[6].amount! * int.parse(qController.text)));
                          // print("food calories${_model.calories}");
                          // print("food calories${_model.carb}");
                          // print("list of titles in fooditem");
                          // print(_Nutrients.titless);
                          String ti = _Nutrients.titless.toString();
                          List<String> lot = ti.split(',');
                          lot.add(suggestion.name!);
                          //print("models title${_model.titles}");
                          _model.titles = lot;
                          //  print(_model.titles);
                          //    print("before add Nutrition");
                          await _Nutrients.addNutrition(nutrients: _model);
                          Fluttertoast.showToast(
                              msg: "${suggestion.name} added");
                          _Nutrients.getNutrients();
                        },
                        noItemsFoundBuilder: (context) => const Center(
                          child: Text("No Meal Found"),
                        ),
                        debounceDuration: const Duration(milliseconds: 20),
                      ),
                    ),
                    // Image.asset(
                    //   'lib/asset/man.png',
                    //   height: 29,
                    //   width: 20,
                    // ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Row(
                      children: [
                        addsubtract_button(
                          icon: Icons.add,
                          func: increment,
                        ),
                        Container(
                          height: 50.h,
                          width: 65.w,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              serving.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        addsubtract_button(
                          icon: Icons.remove,
                          func: decrement,
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(right: 110.w, top: 25.h),
                      child: addFoodButton(text: "Add", func: () {}),
                    ),
                  ])),
            ));
  }

  void increment() {
    setState(() {
      serving++;
    });
  }

  void decrement() {
    if (serving > 1) {
      setState(() {
        serving--;
      });
    }
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
          builder: (context) => IconButton(
                onPressed: () {
                  Get.to(() => HomeScreen());
                },
                icon: Image.asset('lib/asset/back 1.png'),
              )),
      elevation: 0,
      backgroundColor: globalVariables.backgroundColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);
}
