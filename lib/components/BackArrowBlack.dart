import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

class BackArrowBlack extends StatelessWidget {
  const BackArrowBlack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        bottom: 35,
      ),
      child: Row(children: [
        BackArrow(),
        WelcomeColumn(),
      ]),
    );
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

class BackArrow extends StatelessWidget {
  const BackArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0,
        right: 20,
        left: 20,
        bottom: 25,
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: const Color.fromRGBO(15, 13, 11, 1.0), width: 2.5),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: const Color.fromRGBO(15, 13, 11, 1.0),
          icon: const Icon(Icons.arrow_back),
        ),
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
