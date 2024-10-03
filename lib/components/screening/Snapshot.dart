import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/components/BaseCustomCard.dart';

class CameraIcon extends StatelessWidget {
  const CameraIcon({
    super.key,
    this.debugStatement = "Button Pressed",
    this.iconSize,
    required this.iconData,
    this.iconColor,
    this.onPressed,
  });

  final String debugStatement;
  final double? iconSize;
  final Color? iconColor;
  final VoidCallback? onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () {},
      icon: Icon(iconData, color: iconColor ?? Colors.white),
      iconSize: iconSize ?? 60,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.red),
        shadowColor: WidgetStateProperty.all(Colors.black),
        elevation: WidgetStateProperty.all(3),
      ),
    );
  }
}

class SnapshotSubmitted extends StatelessWidget {
  const SnapshotSubmitted({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCustomCard(
      borderColor: AppColors.cream,
      backgroundColor: AppColors.cream,
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.2,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Snapshot Submitted",
            style: TextStyle(
              fontSize: largeFontSize,
            ),
          ),
          Text(
            "Please tap the background to close this message",
            style: TextStyle(
              fontSize: mediumFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
