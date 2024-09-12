import 'package:flutter/material.dart';

// Define the object class with top, right, bottom, left, and a child widget
class PositionedObject {
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final Widget child;

  PositionedObject({
    this.top,
    this.right,
    this.bottom,
    this.left,
    required this.child,
  });
}

// Custom widget class that extends StatelessWidget
class CustomStack extends StatelessWidget {
  final List<PositionedObject> positionedObjects;

  const CustomStack({
    Key? key,
    required this.positionedObjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: positionedObjects.map((posObj) {
        return _buildPositioned(posObj);
      }).toList(),
    );
  }

  // Helper function to create Positioned or non-Positioned widget
  Widget _buildPositioned(PositionedObject posObj) {
    if (posObj.top == null &&
        posObj.right == null &&
        posObj.bottom == null &&
        posObj.left == null) {
      return posObj
          .child; // Return just the child if no positioning is provided
    }

    return Positioned(
      top: posObj.top,
      right: posObj.right,
      bottom: posObj.bottom,
      left: posObj.left,
      child: posObj.child,
    );
  }
}
