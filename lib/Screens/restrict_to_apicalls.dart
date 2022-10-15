import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';

class restrict_to_apicalls extends StatelessWidget {
  const restrict_to_apicalls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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