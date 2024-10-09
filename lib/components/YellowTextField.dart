import 'package:comp30022/color.dart';
import 'package:flutter/material.dart';

class YellowTextField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final double? fontSize;

  const YellowTextField({
    Key? key,
    this.hintText = 'Enter here...',
    this.maxLines = 4,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: fontSize),
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.black54,
          ),
        ),
        filled: true,
        fillColor: AppColors.fieldCream, // Cream background color
      ),
    );
  }
}
