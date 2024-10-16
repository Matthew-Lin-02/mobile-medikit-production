import 'package:flutter/material.dart';
import 'package:comp30022/font.dart';

class DropDown extends StatelessWidget {
  final String label;
  final String hintText;

  const DropDown({super.key, required this.label, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 160,
          height: 66,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(color: Colors.grey.shade800), // border color
            boxShadow: const [shadow],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: label,
              onChanged: (String? newValue) {},
              items:
                  <String>[label].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 4.0), // Apply left padding
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: tinyFontSize),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),
              icon: const Icon(Icons.arrow_drop_down),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextBox(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}

class TextBox extends StatelessWidget {
  final String hintText;
  final double fontSize;
  final double width; // Add a new property for width

  const TextBox(
      {super.key,
      required this.hintText,
      this.width = 1280,
      this.fontSize = 24});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(color: Colors.grey.shade800),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: fontSize),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 20)),
        ),
      ),
    );
  }
}

const shadow = BoxShadow(
  color: Colors.grey,
  spreadRadius: 1,
  blurRadius: 2,
  offset: Offset(0, 3),
);
