import 'package:flutter/material.dart';
import 'package:nutritionanalysis/Components/inputfields.dart';

class OwnNutrients extends StatelessWidget {
  TextEditingController caloreisController = TextEditingController();
  TextEditingController carbController = TextEditingController();
  TextEditingController proteinController = TextEditingController();
  TextEditingController FatController = TextEditingController();
  OwnNutrients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                hint_text: "Enter Calories", controller: caloreisController),
            k,
            inputfields(hint_text: "Enter Carb", controller: carbController),
            k,
            inputfields(
                hint_text: "Enter Protein", controller: proteinController),
            k,
            inputfields(hint_text: "Enter fat", controller: FatController),
          ],
        ),
      ),
    );
  }
}
