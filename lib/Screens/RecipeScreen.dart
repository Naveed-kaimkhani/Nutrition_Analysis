import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nutritionanalysis/model/RecipePageInfo.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Services/Api_Services.dart';
import '../model/RecipeInfo.dart';

class RecipeScreen extends StatelessWidget {
  int? id;
  RecipeScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return false
        ? SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
              child: FutureBuilder(
                  future: Api_Services.getRecipeInform(id: id),
                  builder: (context, AsyncSnapshot<RecipePageInfo> snapshot) {
                    if (snapshot.hasData) {
                      // print(snapshot.data!.length);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(snapshot.data!.image!),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 8.0),
                              child: Text(
                                snapshot.data!.title!,
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          // Text(snapshot.data!.title!),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //MainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Prep Time: \n   ${snapshot.data!.readyInMinutes!} mins",
                                  style: TextStyle(fontSize: 15),
                                ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                Text(
                                  "Servings: \n       ${snapshot.data!.servings}",
                                  style: TextStyle(fontSize: 15),
                                ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                Text(
                                  "Calories: \n  ${snapshot.data!.nutrition!.nutrients![0].amount}",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, top: 12.0),
                            child: Text("Ingredients",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            // color: Colors.black,
                            margin: EdgeInsets.only(top: 6, left: 4),
                            height: size.height / 3,
                            width: size.width,
                            child: ListView.builder(
                                itemCount:
                                    snapshot.data!.extendedIngredients!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, left: 6),
                                    child: Row(
                                      children: [
                                        // Image.network(snapshot.data!
                                        //     .extendedIngredients![index].image!),
                                        Text(
                                          "${snapshot.data!.extendedIngredients![index].name!}  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        // SizedBox(
                                        //   width: 10,
                                        // ),
                                        Text(
                                          "${snapshot.data!.extendedIngredients![index].amount!.toString()} ",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(snapshot.data!
                                            .extendedIngredients![index].unit!
                                            .toString())
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, top: 12.0),
                            child: Text("Instructions",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0, left: 6),
                            child: Text(
                              RemoveHtmlTags(snapshot.data!.instructions!),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, top: 12.0),
                            child: Text("Summary",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0, left: 6),
                            child: Text(
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              RemoveHtmlTags(snapshot.data!.summary!),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            )),
          )
        : SafeArea(
            child: Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: FutureBuilder(
                      future: Api_Services.getRecipeInform(id: id),
                      builder:
                          (context, AsyncSnapshot<RecipePageInfo> snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              Image.network(
                                snapshot.data!.image!,
                                width: size.width,
                                height: size.height / 4,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.title!,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Number of servings",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black)),
                                        Text(
                                            snapshot.data!.servings.toString()),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomprogressIndicator(
                                      percent: "30",
                                      title: "Calories",
                                      LoadingColor: Colors.blueGrey,
                                      ProgressColor: Colors.blueAccent,
                                    ),
                                    CustomprogressIndicator(
                                      percent: "40",
                                      title: "Protein",
                                      ProgressColor: Colors.amber,
                                      LoadingColor: Colors.amber[200],
                                    ),
                                    CustomprogressIndicator(
                                      percent: "40",
                                      title: "Carb",
                                      ProgressColor: Colors.green,
                                      LoadingColor: Colors.green[200],
                                    ),
                                    CustomprogressIndicator(
                                      percent: "40",
                                      title: "Fat",
                                      ProgressColor: Colors.red,
                                      LoadingColor: Colors.red[100],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // Text("fdfdfd"),`
                              Divider(
                                color: Colors.grey,
                                indent: 16,
                                endIndent: 16,
                              )
                            ],
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                )));
  }

  String RemoveHtmlTags(String htmlTags) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    String parsedstring = htmlTags.replaceAll(exp, ' ');

// // var doc = parse(htmlTags);
// if(doc.documentElement != null){
//     String parsedstring = doc.documentElement!.text;
//   }
    return parsedstring;
  }
}

class CustomprogressIndicator extends StatelessWidget {
  final String? percent;
  final String? title;
  final Color? ProgressColor;
  final Color? LoadingColor;
  const CustomprogressIndicator({
    required this.percent,
    required this.title,
    required this.ProgressColor,
    required this.LoadingColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 30,
          lineWidth: 12,
          percent: 0.8,
          progressColor: ProgressColor!,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: LoadingColor!,
          center: new Text(
            percent!,
            style: TextStyle(fontSize: 13),
          ),
          animation: true,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(title!),
        )
      ],
    );
  }
}
