import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Components/inputfields.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';
import 'package:nutritionanalysis/Screens/Search_by_foodItem.dart';

import '../Components/AddNewItemHeader.dart';
import '../Components/addFoodButton.dart';
import '../Services/NutrientsController.dart';
import '../Components/AddNewRecipeTab.dart';
import '../model/NutrientsModel.dart';
import 'Search_By_Recipes.dart';
TextEditingController caloreisController = TextEditingController();
  TextEditingController NameController = TextEditingController();

  TextEditingController carbController = TextEditingController();
  // TextEditingController proteinController = TextEditingController();
  // TextEditingController FatController = TextEditingController();
  TextEditingController ServingController = new TextEditingController();
    var _Nutrients = Get.put(NutrientsController());
  NutrientsModel _model = NutrientsModel(calories: 0, carb: 0, titles: [""]);

class OwnNutrients extends StatelessWidget {
  // TextEditingController caloreisController = TextEditingController();
  // TextEditingController NameController = TextEditingController();

  // TextEditingController carbController = TextEditingController();
  // // TextEditingController proteinController = TextEditingController();
  // // TextEditingController FatController = TextEditingController();
  // TextEditingController ServingController = new TextEditingController();

  OwnNutrients({Key? key}) : super(key: key);
  // NutrientsModel _model = NutrientsModel(calories: 0, carb: 0, titles: [""]);

  @override
  Widget build(BuildContext context) {
    // var _Nutrients = Get.put(NutrientsController());
    SizedBox k = SizedBox(
      height: 26.h,
    );
    return false
        ? Scaffold(
            backgroundColor: Colors.grey,
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // inputfields(
                    //     hint_text: "Enter Food Name", controller: NameController,),
                    // k,
                    // inputfields(
                    //     hint_text: "Enter Calories", controller: caloreisController,keyboardType: TextInputType.number,),
                    // k,
                    // inputfields(hint_text: "Enter Carb", controller: carbController,keyboardType: TextInputType.number,),
                    // k,
                    // inputfields(
                    //     hint_text: "Enter Protein", controller: proteinController),
                    k,
                    Text("Enter Servings",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    inputfields(
                      hint_text: "Enter Serving",
                      controller: ServingController,
                    ),
                    k,
                    Container(
                      height: 50,
                      width: 100,
                      color: Colors.black,
                      child: IconButton(
                        onPressed: () async {
                          _model.calories =
                              (double.parse(caloreisController.text) *
                                  double.parse(ServingController.text));
                          _model.carb = (double.parse(carbController.text) *
                              double.parse(ServingController.text));
                          String ti = _Nutrients.titless.toString();
                          List<String> lot = ti.split(',');
                          lot.add(NameController.text);
                          _model.titles = lot;
                          await _Nutrients.addNutrition(nutrients: _model);
                          _Nutrients.getNutrients();
                          Fluttertoast.showToast(
                              msg: "${NameController.text} added");
                        },
                        icon: Text(
                          "Add",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: globalVariables.backgroundColor,
            appBar: const CustomAppBar(),
            body: SingleChildScrollView(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AddNewItemHeader(),
                        SizedBox(
                          height: 13.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: const AddNewRecipeTab(
                                text: "Add New Recipe",
                                color: Color(0xffFFE8D2),
                                url: 'lib/asset/recipee.png',
                              ),
                              onTap: () => Get.to(() => Search_By_Recipes()),
                            ),
                            GestureDetector(
                              child: const AddNewRecipeTab(
                                text: "Add New Food",
                                color: Color(0xffFFE8D2),
                                url: 'lib/asset/food.png',
                              ),
                              onTap: () => Get.to(() => Search_by_foodItem()),
                            ),
                            const AddNewRecipeTab(
                              text: "Add Custom Food",
                              color: Color(0xffF3AD69),
                              url: 'lib/asset/plus.png',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 34.h,
                        ),
                        Text("Create A Custom\nFood Record",
                            style: TextStyle(
                                fontSize: 34.sp, fontWeight: FontWeight.w700)),
                        SizedBox(
                          height: 34.h,
                        ),
                        inputfields(
                            hint_text: "  Enter food name",
                            controller: NameController),
                        k,
                        inputfields(
                            hint_text: "  Enter Calories",
                            controller: caloreisController),
                        k,
                        inputfields(
                            hint_text: "  Enter Carb",
                            controller: carbController),
                        k,
                        inputfields(
                            hint_text: "  Enter Serving",
                            controller: ServingController),
                        k,
                        addFoodButton(text: "Add",func: addCustomfood,)
                      ])),
            ));
  }
}

void addCustomfood(){
 if (NameController.text != null &&
                                  caloreisController.text != null &&
                                  carbController.text != null &&
                                  ServingController.text != null) {
                                () async {
                                  _model.calories =
                                      (double.parse(caloreisController.text) *
                                          double.parse(ServingController.text));
                                  _model.carb =
                                      (double.parse(carbController.text) *
                                          double.parse(ServingController.text));
                                  String ti = _Nutrients.titless.toString();
                                  List<String> lot = ti.split(',');
                                  lot.add(NameController.text);
                                  _model.titles = lot;
                                  await _Nutrients.addNutrition(
                                      nutrients: _model);
                                  _Nutrients.getNutrients();
                                  Fluttertoast.showToast(
                                      msg: "${NameController.text} added");
                                };
                              }
                              Fluttertoast.showToast(
                                  msg: "Please fill all the fields");
}
// class TextFieldTheme extends StatelessWidget {
//   const TextFieldTheme({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70.h,
//       width: 326.w,
//       //  color: Colors.white,
//       decoration: BoxDecoration(
//           color: Color(0xffFFFFFF),
//           border: Border.all(
//             color: Color.fromARGB(255, 248, 202, 183),
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(10.r)),
//     );
//   }
// }
