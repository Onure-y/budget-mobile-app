import 'package:budget_app_mobile/style/color_style.dart';
import 'package:flutter/material.dart';

class TextStylePackage {
  static TextStyle appBarTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorPackage.primaryTextColor,
  );

  static TextStyle normalTextStlye = TextStyle(
    fontWeight: FontWeight.normal,
    color: ColorPackage.primaryTextColor,
  );
  static TextStyle mediumTextStlye = TextStyle(
    fontWeight: FontWeight.w500,
    color: ColorPackage.primaryTextColor,
  );
  static TextStyle thinTextStlye = TextStyle(
    fontWeight: FontWeight.w300,
    color: ColorPackage.primaryTextColor,
  );
  static TextStyle extraThinTextStlye = TextStyle(
    fontWeight: FontWeight.w100,
    color: ColorPackage.primaryTextColor,
  );
}
