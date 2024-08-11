import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final String step;
  final String label;

  StepIndicator({required this.step, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(step, style: TextStyle(color: Colors.white)),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
