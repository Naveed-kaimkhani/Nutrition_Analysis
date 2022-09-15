import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Components/inputfields.dart';

import '../Services/NutrientsController.dart';
import '../model/NutrientsModel.dart';

class OwnNutrients extends StatelessWidget {
  TextEditingController caloreisController = TextEditingController();
  TextEditingController NameController = TextEditingController();

  TextEditingController carbController = TextEditingController();
  TextEditingController proteinController = TextEditingController();
  TextEditingController FatController = TextEditingController();
  TextEditingController qController = new TextEditingController()..text = '1';

  OwnNutrients({Key? key}) : super(key: key);
  NutrientsModel _model = NutrientsModel(calories: 0, carb: 0, titles: [""]);

  @override
  Widget build(BuildContext context) {
    var _Nutrients = Get.put(NutrientsController());
    SizedBox k = SizedBox(
      height: 40,
    );
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputfields(
                  hint_text: "Enter Food Name", controller: NameController,keyboardType: TextInputType.text,),
              k,
              inputfields(
                  hint_text: "Enter Calories", controller: caloreisController,keyboardType: TextInputType.number,),
              k,
              inputfields(hint_text: "Enter Carb", controller: carbController,keyboardType: TextInputType.number,),
              // k,
              // inputfields(
              //     hint_text: "Enter Protein", controller: proteinController),
              k,
              Text("Enter Servings",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              inputfields(hint_text: "Enter Serving", controller: qController,keyboardType: TextInputType.number,),
              k,
              Container(
                height: 50,
                width: 100,
                color: Colors.black,
                child: IconButton(
                  onPressed: () async {
                    _model.calories = (double.parse(caloreisController.text) *
                        double.parse(qController.text));
                    _model.carb = (double.parse(carbController.text) *
                        double.parse(qController.text));
                    String ti = _Nutrients.titless.toString();
                    List<String> lot = ti.split(',');
                    lot.add(NameController.text);
                    _model.titles = lot;
                    await _Nutrients.addNutrition(nutrients: _model);
                    _Nutrients.getNutrients();
                    Fluttertoast.showToast(msg: "${NameController.text} added");
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
    );
  }
}
