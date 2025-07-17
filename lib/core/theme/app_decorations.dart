// core/theme/app_decorations.dart
import 'package:flutter/material.dart';
import 'palette.dart';

// Box Decorations
BoxDecoration primaryBoxDecoration({required Color color}) => BoxDecoration(
  color: color,
  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
  boxShadow: const [
    BoxShadow(
      color: Palette.greyColor,
      blurRadius: 5.0,
      spreadRadius: 1.0,
      offset: Offset(2.0, 2.0),
    ),
  ],
);

BoxDecoration secondaryBoxDecoration({required Color color}) => BoxDecoration(
  color: color,
  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
);

// Input Decorations
InputDecoration primaryInputDecoration({
  required Color fillColor,
  String? hintText,
}) => InputDecoration(
  hintText: hintText,
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  filled: true,
  fillColor: fillColor,
  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
);

InputDecoration searchInputDecoration({required Color fillColor}) =>
    primaryInputDecoration(
      fillColor: fillColor,
      hintText: 'Search...',
    ).copyWith(prefixIcon: const Icon(Icons.search, color: Palette.iconColor));

// General Box Decorations
BoxDecoration cardDecoration({
  required BuildContext context,
  double borderRadius = 8.0,
  double elevation = 4.0,
  bool isHovering = false,
}) {
  final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return BoxDecoration(
    color:
        isDarkMode
            ? const Color(0xFF1E1E1E) // improved dark surface
            : Colors.white,
    borderRadius: BorderRadius.circular(borderRadius),
    border: Border.all(
      color:
          isDarkMode
              ? Colors.grey.withOpacity(0.2)
              : Colors.black.withOpacity(0.1),
      width: 0.6,
    ),
    boxShadow: [
      if (!isDarkMode || isHovering)
        BoxShadow(
          color: Colors.black.withOpacity(isHovering ? 0.2 : 0.1),
          blurRadius: elevation,
          offset: Offset(0, elevation / 2),
          spreadRadius: 1,
        ),
    ],
  );
}

BoxDecoration card2Decoration({
  required BuildContext context,
  double borderRadius = 12.0,
  double elevation = 6.0,
  bool isHovering = false,
}) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  // Background surface
  final Color backgroundColor =
      isDark
          ? const Color(0xFF252525) // soft dark surface
          : Colors.white;

  // Border style
  final Color borderColor =
      isDark ? Colors.grey.withOpacity(0.15) : Colors.black.withOpacity(0.08);

  // Shadow refinement
  final List<BoxShadow> shadows = [
    if (isDark && isHovering)
      BoxShadow(
        color: Colors.black.withOpacity(0.4),
        blurRadius: elevation,
        offset: Offset(0, elevation / 2),
      )
    else if (!isDark)
      BoxShadow(
        color: Colors.black.withOpacity(isHovering ? 0.15 : 0.08),
        blurRadius: elevation,
        offset: Offset(0, elevation / 2),
      ),
  ];

  return BoxDecoration(
    color: backgroundColor,
    borderRadius: BorderRadius.circular(borderRadius),
    border: Border.all(color: borderColor, width: 0.6),
    boxShadow: shadows,
  );
}
