import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';

class BackArrowTeal extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackArrowTeal({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.turquoise,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        iconSize: 48,
        icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        onPressed: onPressed ??
            () {
              Navigator.pop(context);
            },
      ),
    );
  }
}

class BackArrowWelcome extends StatelessWidget {
  const BackArrowWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        const BackArrowTeal(),
        const SizedBox(width: 50),
        Text("Welcome",
            style: TextStyle(
                fontSize: subHeadingFontSize,
                color: Colors.black.withOpacity(0.7))),
        const SizedBox(width: 20),
        const Image(
          image:
              AssetImage('assets/images/art/small-symbols/people-sitting.png'),
          width: 60,
          height: 60,
        ),
      ]),
      const Row(children: [
        SizedBox(width: 110),
        Text("Olivia", style: TextStyle(fontSize: largeHeadingFontSize))
      ]),
    ]);
  }
}

// Component from old design
class ColoredWelcome extends StatelessWidget {
  const ColoredWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      RichText(
        text: TextSpan(
          text: 'Welcome',
          style: TextStyle(
            fontSize: extraLargeFontSize,
            fontWeight: FontWeight.normal,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = Colors.black,
          ),
        ),
      ),
      RichText(
        text: const TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'W',
              style: TextStyle(color: Color(0xFFC0573B)),
            ),
            TextSpan(
              text: 'e',
              style: TextStyle(color: Color.fromRGBO(68, 154, 117, 1.0)),
            ),
            TextSpan(
              text: 'l',
              style: TextStyle(color: Color.fromRGBO(239, 135, 51, 1.0)),
            ),
            TextSpan(
              text: 'c',
              style: TextStyle(color: Color.fromRGBO(59, 131, 159, 1.0)),
            ),
            TextSpan(
              text: 'o',
              style: TextStyle(color: Color(0xFFC0573B)),
            ),
            TextSpan(
              text: 'm',
              style: TextStyle(color: Color.fromRGBO(68, 154, 117, 1.0)),
            ),
            TextSpan(
              text: 'e',
              style: TextStyle(color: Color.fromRGBO(239, 135, 51, 1.0)),
            ),
          ],
          style: TextStyle(
              fontSize: extraLargeFontSize, fontWeight: FontWeight.normal),
        ),
      ),
    ]);
  }
}

// Component from old design
class WelcomeColumn extends StatelessWidget {
  const WelcomeColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 85),
          child: ColoredWelcome(),
        ),
        Transform.translate(
          offset: const Offset(0, -20),
          child: const Text('Karratanyju Olivia!',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    );
  }
}
