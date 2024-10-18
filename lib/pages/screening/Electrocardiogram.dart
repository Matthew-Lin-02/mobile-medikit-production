import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'dart:math';

class Electrocardiogram extends StatelessWidget {
  const Electrocardiogram({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "ECG Test", pageNum: 3, body: electrocardiogramBody);
  }
}

Builder electrocardiogramBody = Builder(builder: (context) {
  final GlobalKey<_TimerState> timerKey = GlobalKey<_TimerState>();

  return Stack(
    fit: StackFit.expand,
    children: [
      Positioned(
        child: Container(
          color: AppColors.cream,
          child: Column(
            children: [
              const Expanded(flex: 1, child: SizedBox.shrink()),
              FractionallySizedBox(
                  widthFactor: 0.35,
                  child: Text(
                    "Please follow the standard procedure for single lead ECG assessment",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
              const Expanded(flex: 1, child: SizedBox.shrink()),
              Text(
                "Press help button on the bottom corner to view standard procedure",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: smallFontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.5)),
              ),
              const Expanded(flex: 3, child: SizedBox.shrink()),
              Timer(key: timerKey), // Pass the key to Timer widget
              const Expanded(flex: 3, child: SizedBox.shrink()),
              RedActionButton(
                backgroundColor: AppColors.turquoise,
                imageSize: const Size(26, 32),
                imagePath:
                    'assets/images/screening-tools/arrow-right-triangle.png',
                label: "  Begin ECG test",
                onPressed: () {
                  timerKey.currentState?.startTimer(); // Start the timer
                },
                fontSize: 30,
                size: const Size(331, 64),
              ),
              const Expanded(flex: 2, child: SizedBox.shrink()),
              const RedActionButton(
                iconData: Icons.arrow_back,
                iconSize: largeFontSize,
                label: "Back to screening tools",
                fontSize: 30,
                size: Size(450, 64),
              ),
              const Expanded(flex: 6, child: SizedBox.shrink()),
            ],
          ),
        ),
      ),
      const Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
      const Positioned(
          right: 21.0, bottom: 70.0, child: HelpButton(pageName: 'ECG')),
      const Positioned(
          left: 118.0,
          top: 250.0,
          child: Image(
              image: AssetImage(
                  'assets/images/art/x-ray-animals/kangaroo-dots.png'))),
      const Positioned(
          bottom: 0,
          child:
              Image(image: AssetImage('assets/images/art/footer-strip.png'))),
    ],
  );
});

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final int totalDuration = 12; // Total time duration in seconds

  @override
  void initState() {
    super.initState();
    // Set up AnimationController with 12 seconds duration
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: totalDuration),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startTimer() {
    _controller.reset(); // Reset the controller before starting
    _controller.forward(); // Start the animation
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420,
      height: 420,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
          )
        ],
        color: AppColors.lightGrey,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Stack(
          children: [
            CustomPaint(
              size: const Size(420, 420),
              painter: TimerPainter(_controller),
            ),
            const Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Image(
                    width: 240,
                    height: 217,
                    image:
                        AssetImage('assets/images/screening-tools/heart.png'),
                  ),
                ],
              ),
            ),
            const Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    width: 120,
                    height: 120,
                    image:
                        AssetImage('assets/images/screening-tools/pulse.png'),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      int remainingTime =
                          (totalDuration * (1 - _controller.value)).ceil();
                      String displayText =
                          remainingTime > 0 ? "$remainingTime s" : "Done";

                      return Text(
                        displayText, // Display "Done" or remaining time
                        style: GoogleFonts.inter(
                            fontSize: giantFontSize,
                            fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final Animation<double> animation;
  final Paint _borderPaint = Paint()
    ..color = AppColors.turquoise
    ..strokeWidth = 28
    ..style = PaintingStyle.stroke;

  TimerPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    double progress =
        (1 - animation.value) * 2 * pi; // Calculate progress (0 to 2π)

    // Draw the border arc
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2),
      -pi / 2, // Start from 12 o'clock (top of the circle)
      progress, // Draw the arc in an anticlockwise direction
      false, // Arc is not filled
      _borderPaint,
    );
  }

  @override
  bool shouldRepaint(TimerPainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
