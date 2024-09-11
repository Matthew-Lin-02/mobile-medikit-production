import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

class BackArrowWelcome extends StatelessWidget {
  const BackArrowWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        bottom: 35,
      ),
      child: Row(children: [
        Column(children: [BackArrowTeal(), SizedBox(height: 40)]),
        WelcomeColumn(),
      ]),
    );
  }
}

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

class ColoredWelcome extends StatelessWidget {
  const ColoredWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      RichText(
        text: TextSpan(
          text: 'Welcome',
          style: TextStyle(
            fontSize: 40,
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
              style: TextStyle(color: AppColors.red),
            ),
            TextSpan(
              text: 'e',
              style: TextStyle(color: AppColors.green),
            ),
            TextSpan(
              text: 'l',
              style: TextStyle(color: AppColors.orange),
            ),
            TextSpan(
              text: 'c',
              style: TextStyle(color: AppColors.blue),
            ),
            TextSpan(
              text: 'o',
              style: TextStyle(color: AppColors.red),
            ),
            TextSpan(
              text: 'm',
              style: TextStyle(color: AppColors.green),
            ),
            TextSpan(
              text: 'e',
              style: TextStyle(color: AppColors.orange),
            ),
          ],
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),
        ),
      ),
    ]);
  }
}

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
