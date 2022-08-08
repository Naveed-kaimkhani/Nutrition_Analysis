import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Components/inputfields.dart';

import '../Services/NutrientsController.dart';
import '../model/NutrientsModel.dart';

class OwnNutrients extends StatelessWidget {
  TextEditingController caloreisController = TextEditingController();
  TextEditingController carbController = TextEditingController();
  TextEditingController proteinController = TextEditingController();
  TextEditingController FatController = TextEditingController();
  OwnNutrients({Key? key}) : super(key: key);
NutrientsModel _model=NutrientsModel(calories: 0, carb: 0, titles: [""]);

  @override
  Widget build(BuildContext context) {
var _Nutrients=Get.put(NutrientsController());  
    SizedBox k = SizedBox(
      height: 40,
    );
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputfields(
                hint_text: "Enter Food Name", controller: caloreisController),
                k,
                    inputfields(
                hint_text: "Enter Calories", controller: caloreisController),
            k,
            inputfields(hint_text: "Enter Carb", controller: carbController),
            k,
            inputfields(
                hint_text: "Enter Protein", controller: proteinController),
            k,
            inputfields(hint_text: "Enter fat", controller: FatController),

            k,
            IconButton(
              onPressed: (){
            //_model.calories=caloreisController.text,
              }, 
              icon:Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
