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
   final dataMap = <String, double>{
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
  


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
              Padding(
                padding: const EdgeInsets.only(top: 100, right: 200.0),
                child: ListTile(
                  title: Text(
                    "Hi, Naveed",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("todays date"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 70.0),
                child: Row(
                  children: [
                    Button(
                        function: () {
                          Get.to(() => TabBarScreen());
                        },
                        text: "Add new Item"),
                    SizedBox(
                      width: 10,
                    ),
                    Button(
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
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Color(0xFFB9FAFA),
                    borderRadius: BorderRadius.circular(40)),
                height: size.height / 3,
                width: size.width,
                //   color: Colors.grey,

                //   color: Colors.grey,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GetBuilder<NutrientsController>(
                              builder: (controller) {
                            return Text(
                              // _Nutrients.carbs
                              // "Carbs: ${double.parse(controller.carbss).round()}",
                              "Carbs: ${controller.carbss}",

                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                          GetBuilder<NutrientsController>(
                              builder: (controller) {
                            return Text(
                              // _Nutrients.carbs
                              "Calories: ${controller.caloriess}",

                              //"Calories: ${double.parse(controller.caloriess).round().toString()}",
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Center(
                      child: new CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 5.0,
                        percent: 1.0,
                        center: new Text("100%"),
                        progressColor: Colors.green,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text(
                  "Today's Food",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      //  color: Color(0xFFB9FAFA),
                      borderRadius: BorderRadius.circular(40)),
                  height: size.height / 3,
                  width: size.width,
                  //   color: Color.fromARGB(255, 198, 191, 191),
                  child: _Nutrients.titless != null
                      ? GetBuilder<NutrientsController>(builder: (controller) {
                          return ListView.builder(
                              itemCount: _Nutrients.titless.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 50,
                                  width: 50,
                                  //   color: Colors.grey,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFFB9FAFA),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    //   color: Colors.grey,
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      //  child: Text(_Nutrients.titless[index]),
                                      child: GetBuilder<NutrientsController>(
                                          builder: (controller) {
                                        return Text(
                                          // _Nutrients.carbs
                                          _Nutrients.titless[index],
                                        );
                                      }),
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
    );
  }
}
