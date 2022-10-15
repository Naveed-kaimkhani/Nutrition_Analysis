import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Components/addFoodButton.dart';
import 'package:nutritionanalysis/Components/inputfields.dart';
import 'package:nutritionanalysis/Screens/OwnNutrients.dart';
import 'package:nutritionanalysis/Screens/Search_by_foodItem.dart';
import 'package:nutritionanalysis/Services/DbHelper.dart';
import 'package:nutritionanalysis/main.dart';
import 'package:nutritionanalysis/model/RecipeInfo.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';
import 'package:nutritionanalysis/model/TodaysListFoodModel.dart';

import '../Components/AddNewItemHeader.dart';
import '../Components/Button.dart';
import '../Components/addsubtract_button.dart';
import '../Services/Api_Services.dart';
import '../Services/NutrientsController.dart';
import '../Components/AddNewRecipeTab.dart';
import '../Services/UpdateData.dart';
import '../model/NutrientsModel.dart';
import '../model/Response_Model.dart';

class Search_By_Recipes extends StatefulWidget {
  const Search_By_Recipes({Key? key}) : super(key: key);

  @override
  State<Search_By_Recipes> createState() => _Search_By_RecipesState();
}

class _Search_By_RecipesState extends State<Search_By_Recipes> {
  // double? carbs;
  // double? protein;
  int serving = 1;

  // List<String>? ListOfTodaysFood;
  var _Nutrients = Get.put(NutrientsController());
  TextEditingController qController = new TextEditingController()..text = '1';
  @override
  void initState() {
    // TODO: implement initState
    print("in  set state of recipe");
    super.initState();
    _Nutrients.getNutrients();
    // Future<RecipeInfo> rec = Api_Services.getRecipeNutrition(title: "Chicken 65");
    // ListOfTodaysFood = NutrientsController.getTodaysTitles();
    // gettitles();
  }

  @override
  Widget build(BuildContext context) {
    NutrientsModel _model = NutrientsModel(calories: 0, carb: 0, titles: [""]);
    TodaysListFoodModel _todayslistfoodmodel = TodaysListFoodModel();
    return false
        ? Scaffold(
            backgroundColor: Colors.grey,
            body: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Search by Recipes",
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
                  //  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 250,
                  color: Colors.white,
                  child: TypeAheadField<Results>(
                    //debounceDuration : const Duration(milliseconds: 300),

                    textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                      labelText: 'Enter Recipe',
                      //   border: OutlineInputBorder(),
                    )),
                    suggestionsCallback: (pattern) =>
                        Api_Services.getMealSuggestion(query: pattern),
                    itemBuilder: (context, Results suggestion) {
                      final meal = suggestion;
                      return ListTile(
                        title: Card(child: Text(meal.title!)),
                        // trailing: IconButton(
                        //   onPressed: (){
                        //     print(meal.title);
                        //     print("hn bhaii");
                        //  Future<RecipeInfo> recipeInfo= Api_Services.getRecipeNutrition(title:"Chicken 65");
                        //   print(recipeInfo);
                        //   },
                        //    icon: Icon(Icons.add),color: Colors.black,),
                      );
                    },
                    onSuggestionSelected: (Results suggestion) async {
                      List<Nutrients>? nutrients =
                          suggestion.nutrition!.nutrients;
                      // protein = nutrients![0].amount!;
                      // fats = nutrients[1].amount!;
                      // carbs = nutrients[2].amount!;
                      RecipeInfo rc = await Api_Services.getRecipeNutrition(
                          title: suggestion.title);
                      //  print(rc.calories!.value);
                      // _model!.calories=0;
                      // print(_model.calories);
                      _model.calories =
                          (rc.calories!.value! * int.parse(qController.text));
                      //print(_model.calories);
                      _model.carb =
                          (rc.carbs!.value! * int.parse(qController.text));
                      // ListOfTodaysFood!.add(suggestion.title!);
                      // _model.titles = ListOfTodaysFood;
                      await _Nutrients.addNutrition(nutrients: _model);
                      _Nutrients.getNutrients();
                      await _Nutrients.getTodaysTitles();
                      Fluttertoast.showToast(msg: "${suggestion.title} added");
                      // print("get function called after add");
                      // print(rc);
                      // print("protein: ${protein.toString()}");
                      // print("fats: ${fats.toString()}");
                      // print("carbs: ${carbs.toString()}");
                      //this function will execute when user clicks on suggested meal
                    },
                    noItemsFoundBuilder: (context) => const Center(
                      child: Text("No Meal Found"),
                    ),
                    debounceDuration: const Duration(milliseconds: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        : Scaffold(
            // backgroundColor: globalVariables.backgroundColor,
            backgroundColor: globalVariables.backgroundColor,

            appBar: CustomAppBar(),

            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AddNewItemHeader(),
                    SizedBox(
                      height: 13.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const AddNewRecipeTab(
                          text: "Add New Item",
                          color: Color(0xffF3AD69),
                          url: 'lib/asset/recipee.png',
                        ),
                        GestureDetector(
                          child: const AddNewRecipeTab(
                            text: "Add New Food",
                            color: Color(0xffFFE8D2),
                            url: 'lib/asset/food.png',
                          ),
                          onTap: () {
                            Get.to(Search_by_foodItem());
                          },
                        ),
                        GestureDetector(
                          child: const AddNewRecipeTab(
                            text: "Add Custom Food",
                            color: Color(0xffFFE8D2),
                            url: 'lib/asset/plus.png',
                          ),
                          onTap: () => Get.to(() => OwnNutrients()),
                        )
                      ],
                    ),
                    // SizedBox(
                    //   height: 46.h,
                    // ),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),

                      height: 55.h,
                      width: 326.w,
                      //  color: Colors.white,
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          border: Border.all(
                            color: const Color.fromARGB(255, 248, 202, 183),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: TypeAheadField<Results>(
                        //debounceDuration : const Duration(milliseconds: 300),

                        textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                          //labelText: 'Enter item name here',
                          hintText: ' Enter item name here',
                          hintStyle: TextStyle(
                            color: const Color(0xffFFD2BF),
                            fontSize: 16.sp,
                          ),
                          border: InputBorder.none,
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(15),
                          // ),

                          //   border: OutlineInputBorder(),
                        )),
                        suggestionsCallback: (pattern) =>
                            Api_Services.getMealSuggestion(query: pattern),
                        itemBuilder: (context, Results suggestion) {
                          final meal = suggestion;
                          return ListTile(
                            title: Card(child: Text(meal.title!)),
                            // trailing: IconButton(
                            //   onPressed: (){
                            //     print(meal.title);
                            //     print("hn bhaii");
                            //  Future<RecipeInfo> recipeInfo= Api_Services.getRecipeNutrition(title:"Chicken 65");
                            //   print(recipeInfo);
                            //   },
                            //    icon: Icon(Icons.add),color: Colors.black,),
                          );
                        },
                        onSuggestionSelected: (Results suggestion) async {
                          List<Nutrients>? nutrients =
                              suggestion.nutrition!.nutrients;
                          _todayslistfoodmodel.protein = nutrients![0].amount!;
                          _todayslistfoodmodel.fat = nutrients[1].amount!;
                          _todayslistfoodmodel.carb = nutrients[2].amount!;
                          _todayslistfoodmodel.title = suggestion.title;
                          _todayslistfoodmodel.image = suggestion.image;

                          // protein = nutrients![0].amount!;
                          // fats = nutrients[1].amount!;
                          // carbs = nutrients[2].amount!;
                          RecipeInfo rc = await Api_Services.getRecipeNutrition(
                              title: suggestion.title);
                          //  print(rc.calories!.value);
                          // _model!.calories=0;
                          // print(_model.calories);

                          _todayslistfoodmodel.calories = (rc.calories!.value! *
                              int.parse(qController.text));

                          _model.calories = (rc.calories!.value! *
                              int.parse(qController.text));
                          //print(_model.calories);
                          _model.carb =
                              (rc.carbs!.value! * int.parse(qController.text));
                          // ListOfTodaysFood!.add(suggestion.title!);
                          // _model.titles = ListOfTodaysFood;

                          await _Nutrients.addNutrition(nutrients: _model);
                          _Nutrients.getNutrients();
                          // await _Nutrients.getTodaysTitles();
                          Fluttertoast.showToast(
                              msg: "${suggestion.title} added");
                          // print("get function called after add");
                          // print(rc);
                          // print("protein: ${protein.toString()}");
                          // print("fats: ${fats.toString()}");
                          // print("carbs: ${carbs.toString()}");
                          //this function will execute when user clicks on suggested meal
                          //  UpdateData.updateAvailableCalls();
                          await DbHelper.insertToTodayList(
                              _todayslistfoodmodel, "todayfoodlist");
                          _Nutrients.updateAvailableCalls();
                        },
                        noItemsFoundBuilder: (context) => const Center(
                          child: Text("No Meal Found"),
                        ),
                        debounceDuration: const Duration(milliseconds: 10),
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    // // SvgPicture.asset('lib/asset/listt.svg'),
                    // const SizedBox(
                    //   height: 4,
                    // ),
                    // Image.asset('lib/asset/rentB 1.png'),
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
                      padding: EdgeInsets.only(right: 110.w, top: 90.h),
                      child: addFoodButton(text: "Add", func: () {}),
                    )
                  ],
                ),
              ),
            ),
          );
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

  // gettitles() async {
  //   ListOfTodaysFood = await _Nutrients.getTodaysTitles();
  // }
}
