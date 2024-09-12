import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

const Size smallButtonSize = Size(250, 80);
const Size smallButtonSizeCompact = Size(250, 65);
const Size mediumButtonSize = Size(400, 100);
const Size mediumButtonSizeLong = Size(515, 60);
const Size largeButtonSize = Size(900, 130);

class RedActionButton extends StatelessWidget {
  RedActionButton({
    super.key,
    this.iconData,
    required this.label,
    this.onPressed = _defaultButtonFunction,
    this.size = smallButtonSize,
    this.fontSize = 20,
    this.imagePath,
    this.imageSize,
    this.iconSize = 28,
    this.useCircleAvatar = false, // Correctly close the constructor parameter
  });

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
  final double iconSize;
  final bool useCircleAvatar; // New field for CircleAvatar option

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
                ? useCircleAvatar
                    ? CircleAvatar(
                        radius: iconSize / 2, // Control the size of the circle
                        backgroundColor:
                            Colors.white, // Circle background color
                        child: Icon(
                          iconData,
                          size: iconSize,
                          color: AppColors.red, // Red forward arrow color
                        ),
                      )
                    : Icon(
                        iconData,
                        size:
                            iconSize, // Default icon size without CircleAvatar
                        color: Colors
                            .white, // Default icon color if CircleAvatar is not used
                      )
                : const SizedBox
                    .shrink(), // Default to nothing if no icon or image
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
