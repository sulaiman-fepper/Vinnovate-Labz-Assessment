import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  int count;
  ShimmerCard(this.count, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 6),
            width: MediaQuery.of(context).size.width,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)
                ),
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .04),
                width: MediaQuery.of(context).size.width,
                height: 120,
              ),
            ),
          );
        }
    );
  }
}
