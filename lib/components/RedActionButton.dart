import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

class RedActionButton extends StatelessWidget {
  const RedActionButton({
    super.key,
    this.iconData,
    required this.label,
  });

  final IconData? iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        print("Submit button pressed, go to next page");
      },
      icon: iconData != null
          ? Icon(iconData)
          : const SizedBox.shrink(), // Conditionally show the icon
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(Colors.white),
        backgroundColor: WidgetStateProperty.all(AppColors.red),
        minimumSize: WidgetStateProperty.all<Size>(const Size(200, 80)),
      ),
    );
  }
}
