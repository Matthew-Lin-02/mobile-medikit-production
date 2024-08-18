import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String label;
  final String hintText;

  DropDown({required this.label, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 128,
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(color: Colors.grey.shade800), // border color
            boxShadow: [shadow],
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                );
              }).toList(),
              icon: Icon(Icons.arrow_drop_down),
            ),
          ),
        ),
        SizedBox(width: 16),
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

  const TextBox({required this.hintText, this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(color: Colors.grey.shade800),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: fontSize),
            border: InputBorder.none,
          ),
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
