
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
        child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[200]!,
      child:SingleChildScrollView(
        child:      Container(
          height: 90,
          width: 90,
          color: Colors.grey,
        )  ),
      ),
    );
  }
}

class shimmerlist extends StatelessWidget {
  const shimmerlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 6.0),
        child: Container(
          width: screenSize.width,
          height: screenSize.height / 4.5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: screenSize.height / 7,
                  width: screenSize.width * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey),
                ),
              );
            },
          ),
        ));
  }
}
