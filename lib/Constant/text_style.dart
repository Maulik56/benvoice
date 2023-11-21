import 'package:benvoice/Constant/font_family.dart';
import 'package:flutter/material.dart';

class FontTextStyle {
  static TextStyle w700Style({required Color color, required double fontSize}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.alef,
    );
  }

  static TextStyle w400Style({required Color color, required double fontSize}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.alef,
    );
  }
}
