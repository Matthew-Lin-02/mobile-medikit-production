import 'package:flutter/material.dart';

class BaseCustomCard extends StatelessWidget {
  final Widget? child;
  final Color borderColor;
  final Color backgroundColor;
  final double borderRadius;
  final double borderWidth;
  final bool isShadowOn;
  final double? width; // Optional width
  final double? height; // Optional height

  const BaseCustomCard({
    Key? key,
    this.child,
    required this.borderColor,
    required this.backgroundColor,
    this.borderRadius = 16.0,
    this.borderWidth = 2.0,
    this.isShadowOn = false,
    this.width, // Optional width
    this.height, // Optional height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Apply width if provided, else auto-size
      height: height, // Apply height if provided, else auto-size
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor, // Customizable background color
        border: Border.all(
          color: borderColor, // Customizable border color
          width: borderWidth,
          style: BorderStyle.solid, // You can adjust the border width here
        ),
        boxShadow: isShadowOn
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: Offset(0, 4),
                  blurRadius: 4,
                ),
              ]
            : null,
      ),
      child: child ?? const SizedBox.shrink(),
    );
  }
}
