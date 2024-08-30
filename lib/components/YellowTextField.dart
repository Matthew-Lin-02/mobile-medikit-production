import 'package:flutter/material.dart';

class YellowTextField extends StatelessWidget {
  final String hintText;
  final int maxLines;

  const YellowTextField({
    Key? key,
    this.hintText = 'Enter here...',
    this.maxLines = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
        fillColor: Color(0xFFFFF5E1), // Cream background color
      ),
    );
  }
}
