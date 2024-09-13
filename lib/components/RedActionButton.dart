import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

const Size smallButtonSize = Size(250, 80);
const Size smallButtonSizeCompact = Size(250, 65);
const Size mediumButtonSize = Size(400, 100);
const Size mediumButtonSizeLong = Size(515, 60);
const Size largeButtonSize = Size(900, 130);

const double smallButtonFontSize = 28.0;
const double largeButtonFontSize = 40.0;

class RedActionButton extends StatelessWidget {
  const RedActionButton(
      {super.key,
      this.iconData,
      required this.label,
      this.onPressed = _defaultButtonFunction,
      this.size = smallButtonSize,
      this.fontSize = smallButtonFontSize,
      this.imagePath,
      this.imageSize});

  static void _defaultButtonFunction() {
    print('Button pressed');
  }

  final IconData? iconData;
  final String label;
  final VoidCallback onPressed;
  final Size? size;
  final double fontSize;
  final String? imagePath;
  final Size? imageSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size?.width,
      height: size?.height,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: imagePath != null
            ? Image(
                image: AssetImage(imagePath!),
                width: imageSize?.width,
                height: imageSize?.height,
              )
            : iconData != null
                ? Icon(iconData)
                : const SizedBox.shrink(), // Conditionally show the icon/image
        label: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
        style: ButtonStyle(
          iconColor: WidgetStateProperty.all(Colors.white),
          backgroundColor: WidgetStateProperty.all(AppColors.red),
          minimumSize: WidgetStateProperty.all<Size>(size!),
          shadowColor: WidgetStateProperty.all(Colors.black),
          elevation: WidgetStateProperty.all(3),
        ),
      ),
    );
  }
}
