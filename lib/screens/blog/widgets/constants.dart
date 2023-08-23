import 'package:avua/core/color_constants.dart';
import 'package:flutter/material.dart';

class BlogConstants {
  static TextStyle titleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,

    // color: ColorConstant.whiteColor,
    fontSize: 28,
  );
  static TextStyle contentStyle = const TextStyle(
    // fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 16,
  );
  static TextStyle articleTitleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorConstant.primaryColor,
    fontSize: 32,
  );
  static TextStyle introStyle = const TextStyle(
    // fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 16,
  );
  static TextStyle subTitleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 18,
  );
  static TextStyle subTitleContentStyle = const TextStyle(
    fontSize: 16,
    // fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}
