import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Components/Button.dart';
import 'package:nutritionanalysis/Screens/NoUserFound.dart';
import 'package:nutritionanalysis/Screens/SearchRecipes.dart';
import 'package:nutritionanalysis/Services/NutrientsController.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Services/UpdateData.dart';
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 110),
                decoration: BoxDecoration(
                    color: Color(0xFFB9FAFA),
                    borderRadius: BorderRadius.circular(40)),
                height: size.height / 3,
                width: size.width,
                //   color: Colors.grey,
                child: Row(
                  children: [
                    Text("Calories"),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: new CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 5.0,
                          percent: 1.0,
                          center: new Text("100%"),
                          progressColor: Colors.green,
                        ),
                      ),
                    ),
                    Text("Carbs"),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFB9FAFA),
                      borderRadius: BorderRadius.circular(40)),
                  height: size.height / 3,
                  width: size.width,
                  //   color: Color.fromARGB(255, 198, 191, 191),
                  child: _Nutrients.titless != null
                      ? GetBuilder<NutrientsController>(builder: (controller) {
                          return ListView.builder(
                              itemCount: _Nutrients.titless.length,
                              itemBuilder: (context, index) {
                                return SizedBox();
                                // return Container(
                                //   // height: 50,
                                //   // width: 50,
                                //   //   color: Colors.grey,
                                //   child: Card(
                                //     //   color: Colors.grey,
                                //     child: Padding(
                                //       padding: const EdgeInsets.all(8.0),
                                //       //  child: Text(_Nutrients.titless[index]),
                                //       // child: GetBuilder<NutrientsController>(
                                //       //     builder: (controller) {
                                //       //   return Text(
                                //       //     // _Nutrients.carbs
                                //       //     _Nutrients.titless[index],
                                //       //   );
                                //       // }),
                                //     ),
                                //   ),
                                // );
                              });
                        })
                      : Center(
                          child: Text("Nothing to show"),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
