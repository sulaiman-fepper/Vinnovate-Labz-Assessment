import 'package:assessment/utils/custom_color.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class PrimaryButtonWidget extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;

  const PrimaryButtonWidget({Key? key, required this.title, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      // constraints: BoxConstraints(
      //   maxWidth: double.infinity
      // ),
      // color: CustomColor.primaryButtonColor,
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: CustomStyle.textButtonStyle,
        child: Text(
            title,
          style: TextStyle(
              color: Colors.white.withOpacity(.8),
              fontSize: Dimensions.largeTextSize,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
