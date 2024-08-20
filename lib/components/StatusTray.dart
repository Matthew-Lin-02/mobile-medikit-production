import 'package:flutter/material.dart';

import 'package:comp30022/color.dart';

class StatusTray extends StatelessWidget {
  var iconSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.only(left: 2.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 5, 161, 182),
            borderRadius: BorderRadius.circular(80.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatusIcon(
                  iconSize: iconSize,
                  image: 'assets/images/wifi-connection.png'),
              StatusIcon(iconSize: iconSize, image: 'assets/images/globe.png'),
              StatusIcon(
                  iconSize: iconSize,
                  image: 'assets/images/person-outline.png'),
              StatusIcon(
                  iconSize: iconSize, image: 'assets/images/settings.png'),
              StatusIcon(iconSize: iconSize, image: 'assets/images/phone.png'),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: StatusIcon(
                    iconSize: iconSize, image: 'assets/images/ambulance.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusIcon extends StatelessWidget {
  const StatusIcon({
    super.key,
    this.debugStatement = "Button Pressed",
    required this.iconSize,
    required this.image,
  });

  final String debugStatement;
  final double iconSize;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iconSize,
      width: iconSize,
      child: IconButton(
          onPressed: () {},
          icon: Image.asset(image),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          style: const ButtonStyle(overlayColor: WidgetStateColor.transparent)),
    );
  }
}
