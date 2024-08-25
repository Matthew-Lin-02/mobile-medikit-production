import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

class RedActionButton extends StatelessWidget {
  const RedActionButton({
    super.key,
    this.iconData,
    required this.label,
    this.onPressed = _defaultButtonFunction,
    this.size = const Size(200, 80),
    this.fontSize = 20,
  });

  static void _defaultButtonFunction() {
    print('Button pressed');
  }

  final IconData? iconData;
  final String label;
  final VoidCallback onPressed;
  final Size size; // New size field
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: iconData != null
          ? Icon(iconData)
          : const SizedBox.shrink(), // Conditionally show the icon
      label: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: fontSize),
      ),
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(Colors.white),
        backgroundColor: WidgetStateProperty.all(AppColors.red),
        minimumSize: WidgetStateProperty.all<Size>(
            size), // Use the given or default size
      ),
    );
  }
}
