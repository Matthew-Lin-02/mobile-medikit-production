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
    this.iconSize = 28,
    this.useCircleAvatar =
        false, // Add option for CircleAvatar, default is false
  });

  static void _defaultButtonFunction() {
    print('Button pressed');
  }

  final IconData? iconData;
  final String label;
  final VoidCallback onPressed;
  final Size size;
  final double fontSize;
  final double iconSize;
  final bool useCircleAvatar; // New field for CircleAvatar option

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: iconData != null
          ? useCircleAvatar
              ? CircleAvatar(
                  radius: iconSize / 2, // Control the size of the circle
                  backgroundColor: Colors.white, // Circle background color
                  child: Icon(
                    iconData,
                    size: iconSize,
                    color: AppColors.red, // Red forward arrow color
                  ),
                )
              : Icon(
                  iconData,
                  size: iconSize, // Default icon size without CircleAvatar
                  color: Colors
                      .white, // Default icon color if CircleAvatar is not used
                )
          : const SizedBox.shrink(), // Conditionally show the icon
      label: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: fontSize),
      ),
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(Colors.white),
        backgroundColor: WidgetStateProperty.all(AppColors.red),
        minimumSize: WidgetStateProperty.all<Size>(size), // Set button size
      ),
    );
  }
}
