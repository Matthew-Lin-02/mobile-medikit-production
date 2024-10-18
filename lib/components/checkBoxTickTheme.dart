import 'package:comp30022/color.dart';
import 'package:flutter/material.dart';

CheckboxThemeData checkBoxTickTheme = CheckboxThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
  fillColor: WidgetStateProperty.resolveWith(
    (states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.black; // Color when selected
      }
      return AppColors.lightGrey; // Color when unselected
    },
  ),
  side: WidgetStateBorderSide.resolveWith(
    (states) => BorderSide(
      color: states.contains(WidgetState.selected)
          ? Colors.black
          : Colors.white, // Border color
      width: 2.0,
    ),
  ),
);
