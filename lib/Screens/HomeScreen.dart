import 'package:flutter/material.dart';
import 'package:nutritionanalysis/Components/Button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cal = 0;
    double carb = 0;
    List<String>? today_food;
    List<String> ls = [
      "Chicken",
      "Chicken",
      "Chicken",
      "Chicken",
      "Chicken",
      "Tea",
      "Tea",
      "Tea",
      "Tea",
      "Tea"
    ];
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
                      vertical: 50.0, horizontal: 40.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Calories: $cal",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Carbs: $carb",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 120.0),
                        child: Button(function: () {}, text: "Add new Item"),
                      ),
                    const  SizedBox(
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
                child: today_food != null? 
                ListView.builder(
                    itemCount: today_food!.length,
                    itemBuilder: (context, index) {
                      return Container(
                              height: 50,
                              width: 50,
                              //   color: Colors.grey,
                              child: Card(
                                color: Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(ls[index]),
                                ),
                              ),
                          );
                            
   } ): Center(
                              child: Text("Nothing to show"),
                            )
              )
            ],
          ),
        ),
      ),
    );
  }
}
