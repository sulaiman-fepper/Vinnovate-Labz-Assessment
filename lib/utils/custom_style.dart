import 'package:flutter/material.dart';
import 'custom_color.dart';
import 'dimensions.dart';

class CustomStyle {

  static var textStyle = TextStyle(
      color: CustomColor.black,
      fontSize: Dimensions.smallTextSize,
      fontWeight: FontWeight.w300
  );

  static var loginHeaderStyle = TextStyle(
      color: CustomColor.black,
      fontSize: Dimensions.extraLargeTextSize,
      fontWeight: FontWeight.w500
  );

  static var cardHeadingStyle = TextStyle(
      color: CustomColor.black,
      fontSize: Dimensions.smallTextSize,
      fontWeight: FontWeight.w600,
  );
  static var cardSubHeadingStyle = TextStyle(
    color: CustomColor.gray,
    fontSize: Dimensions.extraSmallTextSize,
    fontWeight: FontWeight.w400,
  );

  static var ratingStyle = TextStyle(
    color: CustomColor.gray,
    fontSize: Dimensions.extraSmallTextSize,
    fontWeight: FontWeight.w400,
  );

  static var textLabelStyle = TextStyle(
      color: CustomColor.black,
      fontSize: Dimensions.smallTextSize,
      fontWeight: FontWeight.w500
  );

  static var rightLabelStyle = TextStyle(
      color: CustomColor.gray,
      fontSize: Dimensions.smallTextSize,
      fontWeight: FontWeight.w400
  );

  static var errorLabelStyle = TextStyle(
      color: CustomColor.red,
      fontSize: Dimensions.smallTextSize,
      fontWeight: FontWeight.w400
  );

  static var hintTextStyle = TextStyle(
      fontSize: Dimensions.smallTextSize,
      fontWeight: FontWeight.w400
  );

  static var textButtonStyle = TextButton.styleFrom(
    elevation: 2,
    backgroundColor: CustomColor.primaryButtonColor,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))),
  );

  static var secondaryTextButtonStyle = TextButton.styleFrom(
      backgroundColor: CustomColor.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      side: const BorderSide(color: CustomColor.primaryColor));
}