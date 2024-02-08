import 'package:assessment/utils/custom_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RightAlignedLabelWidget extends StatelessWidget {

  String text;

  RightAlignedLabelWidget({Key? key, required this.text}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
            text,
            textAlign: TextAlign.left,
            style: CustomStyle.rightLabelStyle
        ),
      ),
    );
  }
}
