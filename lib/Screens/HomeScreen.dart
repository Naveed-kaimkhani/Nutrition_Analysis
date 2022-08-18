import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Components/Button.dart';
import 'package:nutritionanalysis/Screens/NoUserFound.dart';
import 'package:nutritionanalysis/Screens/SearchRecipes.dart';
import 'package:nutritionanalysis/Services/NutrientsController.dart';

import '../Services/UpdateData.dart';
import 'TabBarScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//  double? calories;
  var _Nutrients = Get.put(NutrientsController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("in home page init state");
    // print("init of homepage");
    UpdateData.UpdateValues();
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
                height: size.height / 2,
                width: size.width,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 40.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        // print("");
                        return Text(
                          // _Nutrients.carbs
                          "Calories: ${_Nutrients.caloriess}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        return Text(
                          // _Nutrients.carbs
                          "Carbs: ${_Nutrients.carbss}",
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
                        padding: const EdgeInsets.only(top: 10.0, left: 120.0),
                        child: Button(
                            function: () {
                              Get.to(() => TabBarScreen());
                            },
                            text: "Add new Item"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0, left: 120.0),
                        child: Button(
                            function: () {
                              UpdateData.UpdateValues();
                              _Nutrients.getNutrients();
                            },
                            text: "make 0"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 120.0),
                        child: Button(
                            function: () async {
                              //await  FirebaseAuth.instance.signOut();
                              User? user = FirebaseAuth.instance.currentUser;

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
                      Text(
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
                      ? ListView.builder(
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
                                  child: Text(_Nutrients.titless[index]),
                                ),
                              ),
                            );
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
