import 'package:flutter/material.dart';

import 'package:nutritionanalysis/Constant/globlevariables.dart';

class restrict_to_apicalls extends StatelessWidget {
  const restrict_to_apicalls({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: globalVariables.backgroundColor,
      body: Center(
        child:Center(
          child: Text("Api calls limit Reached",style: TextStyle(
            fontSize: 28,
          
          ),),
        ) ),
    );
  }
}