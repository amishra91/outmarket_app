import 'package:flutter/material.dart';

class SizeUtils {
  static double width = 0;
  static double height = 0;

  static void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}

extension SizeUtilsExtension on num {
  double get w => (this / 375) * SizeUtils.width;
  double get h => (this / 812) * SizeUtils.height;

  double get sp => (this / 375) * SizeUtils.width;

  // get n% of screen width
  double get wp => this * SizeUtils.width;
  double get hp => this * SizeUtils.height;
}
