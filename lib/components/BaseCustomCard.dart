import 'package:flutter/material.dart';

class BaseCustomCard extends StatelessWidget {
  final Widget? child;
  final Color? borderColor;
  final Color backgroundColor;
  final double borderRadius;
  final double? borderWidth; // Optional border width (null or 0 for no border)
  final bool isShadowOn;
  final double? width; // Optional width
  final double? height; // Optional height

  const BaseCustomCard({
    super.key,
    this.child,
    this.borderColor,
    required this.backgroundColor,
    this.borderRadius = 16.0,
    this.borderWidth, // Optional border width
    this.isShadowOn = false,
    this.width, // Optional width
    this.height, // Optional height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Apply width if provided, else auto-size
      height: height, // Apply height if provided, else auto-size
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor, // Customizable background color
        border: (borderWidth != null && borderWidth! > 0)
            ? Border.all(
                color: borderColor ??
                    Colors
                        .transparent, // Use transparent if no color is provided
                width: borderWidth!,
              )
            : null, // No border if borderWidth is null or 0
        boxShadow: isShadowOn
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ]
            : null,
      ),
      child: child ?? const SizedBox.shrink(),
    );
  }
}
