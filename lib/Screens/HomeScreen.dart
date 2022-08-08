import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Components/Button.dart';
import 'package:nutritionanalysis/Screens/TabBarScreen.dart';
import 'package:nutritionanalysis/Services/NutrientsController.dart';

import '../Services/Api_Services.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> today_food = ["fdfd", "fdfsdfs", "fdfsfsd"];
  double? calories;
  var _Nutrients = Get.put(NutrientsController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init of homepage");
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
                      vertical: 30.0, horizontal: 40.0),
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
                            fontSize: 30,
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
                            fontSize: 30,
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
                  child: today_food != null
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
