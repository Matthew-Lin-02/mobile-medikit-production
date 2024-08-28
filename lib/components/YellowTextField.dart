import 'package:flutter/material.dart';

class YellowTextField extends StatelessWidget {
  final String hintText;

  const YellowTextField({
    Key? key,
    this.hintText = 'Enter here...',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 4,
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
