import 'package:flutter/material.dart';

class MultiPurposeCarousel extends StatelessWidget {
  final List<Widget> widgets;

  const MultiPurposeCarousel({super.key, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      //flex: 2,
      fit: FlexFit.loose,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widgets,
        ),
      ),
    );
  }
}
