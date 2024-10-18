import 'package:comp30022/components/YellowTextField.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/font.dart';

class MedicalHistorySubItem extends StatelessWidget {
  final String title;
  final String description;
  final String hintText;
  final int maxLines;

  const MedicalHistorySubItem({
    super.key,
    required this.title,
    required this.description,
    this.hintText = 'Enter here...',
    this.maxLines = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: extraSmallFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: const TextStyle(
            fontSize: tinyFontSize,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        YellowTextField(hintText: hintText, maxLines: maxLines),
      ],
    );
  }
}
