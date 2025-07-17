// core/theme/button_styles.dart
import 'package:flutter/material.dart';

ButtonStyle elevatedButtonStyle({
  required Color foregroundColor,
  required Color backgroundColor,
  required double fontSize,
}) => ElevatedButton.styleFrom(
  foregroundColor: foregroundColor,
  backgroundColor: backgroundColor,
  elevation: 2.0, // Lower elevation looks sleeker
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
  padding: EdgeInsets.symmetric(
    vertical: fontSize * 0.3, // Smaller padding
    horizontal: fontSize, // Smaller horizontal padding
  ),
  minimumSize: Size(0, fontSize * 2.5), // You can tweak this height
  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink clickable area
  textStyle: TextStyle(
    fontSize: fontSize,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
  ),
);

ButtonStyle outlinedButtonStyle({
  required Color foregroundColor,
  required Color borderColor,
  required double fontSize,
}) => OutlinedButton.styleFrom(
  foregroundColor: foregroundColor,
  side: BorderSide(color: borderColor),
  padding: EdgeInsets.symmetric(
    horizontal: fontSize * 0.3,
    vertical: fontSize * 0.3,
  ),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
  minimumSize: Size(fontSize * 5, fontSize * 2),
  textStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
);

ButtonStyle textButtonStyle({
  required Color foregroundColor,
  required double fontSize,
}) => TextButton.styleFrom(
  foregroundColor: foregroundColor,
  padding: EdgeInsets.symmetric(
    horizontal: fontSize * 0.3,
    vertical: fontSize * 0.3,
  ),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
  minimumSize: Size(fontSize * 5, fontSize * 2),
  textStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
);
