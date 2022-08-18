import 'package:flutter/material.dart';

import '../Components/RecipeItem.dart';
import '../Components/SearchBarWidget.dart';
import '../Services/Api_Services.dart';
import '../model/Response_Model.dart';

class ResultScreen extends StatelessWidget {
  final String query;
  const ResultScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(
          isReadOnly: false,
          hasBackButton: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Showing results for ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: query,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
            ),
            // SizedBox(
            //   height: 5.h,
            // ),
            Expanded(
                child: FutureBuilder(
                    future: Api_Services.getMealSuggestion(query: query),
                    builder: (context, AsyncSnapshot<List<Results>> snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data!.length);
                        return GridView.builder(
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2 / 3.3,
                            ),
                            itemBuilder: (context, index) {
                              return RecipeItem(
                                recipe: snapshot.data![index],
                              );
                            });
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
