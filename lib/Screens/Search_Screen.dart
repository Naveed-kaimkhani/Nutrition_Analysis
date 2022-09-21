import 'package:flutter/material.dart';

import '../Components/SearchBarWidget.dart';

class Search_Screen extends StatelessWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchBarWidget(isReadOnly: false, hasBackButton: true),
        ),
      ),
    );
  }
}
