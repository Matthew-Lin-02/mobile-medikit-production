import 'package:comp30022/components/YellowTextField.dart';
import 'package:flutter/material.dart';

class MedicalHistorySubItem extends StatelessWidget {
  final String title;
  final String description;
  final String hintText;

  const MedicalHistorySubItem({
    Key? key,
    required this.title,
    required this.description,
    this.hintText = 'Enter here...',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        YellowTextField(hintText: hintText),
      ],
    );
  }
}
