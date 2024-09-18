import 'package:flutter/material.dart';

/// MultiPurposeCarousel takes a list of widgets and displays them in a row
/// Any overflowing widgets can be accessed by scrolling.
/// The carousel expands to fill its parent so does not required a size.

class MultiPurposeCarousel extends StatelessWidget {
  final List<Widget> widgets;

  const MultiPurposeCarousel({super.key, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
