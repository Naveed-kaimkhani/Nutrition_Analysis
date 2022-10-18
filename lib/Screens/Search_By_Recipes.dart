import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Components/addFoodButton.dart';
import 'package:nutritionanalysis/Screens/OwnNutrients.dart';
import 'package:nutritionanalysis/Screens/Search_by_foodItem.dart';
import 'package:nutritionanalysis/Services/DbHelper.dart';
import 'package:nutritionanalysis/model/RecipeInfo.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';
import 'package:nutritionanalysis/model/TodaysListFoodModel.dart';

import '../Components/AddNewItemHeader.dart';
import '../Components/addsubtract_button.dart';
import '../Services/Api_Services.dart';
import '../Services/NutrientsController.dart';
import '../Components/AddNewRecipeTab.dart';
import '../model/NutrientsModel.dart';
import '../model/Response_Model.dart';

class Search_By_Recipes extends StatefulWidget {
  const Search_By_Recipes({Key? key}) : super(key: key);

  @override
  State<Search_By_Recipes> createState() => _Search_By_RecipesState();
}

class _Search_By_RecipesState extends State<Search_By_Recipes> {
  int serving = 1;

  var _Nutrients = Get.put(NutrientsController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Nutrients.getNutrients();
  }

  @override
  Widget build(BuildContext context) {
    NutrientsModel _model = NutrientsModel(calories: 0, carb: 0, titles: [""]);
    TodaysListFoodModel _todayslistfoodmodel = TodaysListFoodModel();
    return Scaffold(
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
              Container(
                margin: EdgeInsets.only(top: 36.h),
                height: 55.h,
                width: 326.w,
                decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    border: Border.all(
                      color: const Color.fromARGB(255, 248, 202, 183),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.r)),
                child: TypeAheadField<Results>(
                  textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(
                    hintText: ' Enter item name here',
                    hintStyle: TextStyle(
                      color: const Color(0xffFFD2BF),
                      fontSize: 16.sp,
                    ),
                    border: InputBorder.none,
                  )),
                  suggestionsCallback: (pattern) =>
                      Api_Services.getMealSuggestion(query: pattern),
                  itemBuilder: (context, Results suggestion) {
                    final meal = suggestion;
                    return ListTile(
                      title: Card(child: Text(meal.title!)),
                    );
                  },
                  onSuggestionSelected: (Results suggestion) async {
                    List<Nutrients>? nutrients =
                        suggestion.nutrition!.nutrients;
                    _todayslistfoodmodel.protein = nutrients![0].amount!;
                    _todayslistfoodmodel.fat = nutrients[1].amount!;

                    _todayslistfoodmodel.title = suggestion.title;
                    _todayslistfoodmodel.image = suggestion.image;

                    RecipeInfo rc = await Api_Services.getRecipeNutrition(
                        title: suggestion.title);

                    _todayslistfoodmodel.calories =
                        (rc.calories!.value! * serving);
                    _todayslistfoodmodel.carb = rc.carbs!.value;
                    _model.calories = (rc.calories!.value! * serving);
                    _model.carb = (rc.carbs!.value! * serving);

                    await _Nutrients.addNutrition(nutrients: _model);
                    _Nutrients.getNutrients();
                    _Nutrients.updateAvailableCalls();

                    await DbHelper.insertToTodayList(
                        _todayslistfoodmodel, "todayfoodlist");
                    Fluttertoast.showToast(msg: "${suggestion.title} added");
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
}
