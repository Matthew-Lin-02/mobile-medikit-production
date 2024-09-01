import 'package:flutter/material.dart';

int SCALE = 1; // Scale does not work

// The circles with each of the step numbers
class IndicatorStep extends StatelessWidget {
  final String stepNum;
  final int step;
  final int currStep;
  final String text;

  const IndicatorStep(
      {this.stepNum = "00",
      this.step = 0,
      this.currStep = 0,
      this.text = "N/A"});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: 25.0 * SCALE, // Size of the circle
            height: 25.0 * SCALE,
            child: Center(
                child: Text(
              stepNum,
              style: TextStyle(
                color: step >= currStep ? Colors.black : Colors.white,
                fontSize: (11.0 * SCALE),
              ),
            )),
            decoration: BoxDecoration(
                // Draw the circle around the text
                shape: BoxShape.circle,
                color: step >= currStep
                    ? Colors.white
                    : Color.fromRGBO(35, 81, 104, 1),
                border: step <= currStep
                    ? Border.all(color: Color.fromRGBO(0, 68, 95, 1), width: 2)
                    : Border.all(
                        color: const Color.fromARGB(255, 143, 143, 143),
                        width: 2))),
      ],
    );
  }
}

// Creates a container with text centered within it, also colours and bolds accordingly
class IndicatorPageName extends StatelessWidget {
  final String text;
  final double boxSize;
  final bool bold;
  final bool coloured;

  IndicatorPageName(
      {required this.boxSize,
      required this.text,
      required this.bold,
      required this.coloured});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
          child: Text(
        text,
        textScaler: TextScaler.linear(1.2),
        style: TextStyle(
          fontSize: 11.0 * SCALE,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: coloured
              ? Color.fromRGBO(35, 81, 104, 1)
              : Color.fromARGB(255, 88, 88, 88),
        ),
      )),
    );
  }
}

// The line between each of the circles
class IndicatorLine extends StatelessWidget {
  final bool coloured;
  IndicatorLine({required this.coloured});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: //SizedBox(height: 20), // Vertical offset
          SizedBox(
        height: 2,
        width: 400,
        child: ColoredBox(
          color: coloured
              ? Color.fromRGBO(35, 81, 104, 1)
              : Color.fromARGB(255, 142, 142, 142),
        ),
      ),
    );
  }
}

// The row that should be called to draw the circles with step numbers
class PageIndicator extends StatelessWidget {
  final int pageNum;
  PageIndicator({this.pageNum = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        child: Row(children: [
          SizedBox(width: 35),
          IndicatorStep(
            stepNum: "01",
            step: 1,
            currStep: pageNum,
          ),
          IndicatorLine(coloured: pageNum > 1),
          IndicatorStep(
            stepNum: "02",
            step: 2,
            currStep: pageNum,
          ),
          IndicatorLine(coloured: pageNum > 2),
          IndicatorStep(
            stepNum: "03",
            step: 3,
            currStep: pageNum,
          ),
          IndicatorLine(coloured: pageNum > 3),
          IndicatorStep(
            stepNum: "04",
            step: 4,
            currStep: pageNum,
          ),
          IndicatorLine(coloured: pageNum > 4),
          IndicatorStep(
            stepNum: "05",
            step: 5,
            currStep: pageNum,
          ),
          IndicatorLine(coloured: pageNum > 5),
          IndicatorStep(
            stepNum: "06",
            step: 6,
            currStep: pageNum,
          ),
          IndicatorLine(coloured: pageNum > 6),
          IndicatorStep(
            stepNum: "07",
            step: 7,
            currStep: pageNum,
          ),
          IndicatorLine(coloured: pageNum > 7),
          IndicatorStep(
            stepNum: "08",
            step: 8,
            currStep: pageNum,
          ),
          SizedBox(width: 35),
        ]));
  }
}

// Draws the second row with the step names
class PageIndicatorNames extends StatelessWidget {
  final int currPage;

  PageIndicatorNames({required this.currPage});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20,
        child: Row(
          children: <Widget>[
            IndicatorPageName(
              boxSize: 95.0 * SCALE,
              text: "Patient sign up",
              bold: currPage > 1,
              coloured: currPage >= 1,
            ),
            IndicatorPageName(
              boxSize: 95.0 * SCALE,
              text: "Consultation",
              bold: currPage > 2,
              coloured: currPage >= 2,
            ),
            IndicatorPageName(
              boxSize: 95.0 * SCALE,
              text: "Screening Tools",
              bold: currPage > 3,
              coloured: currPage >= 3,
            ),
            IndicatorPageName(
              boxSize: 95.0 * SCALE,
              text: "Results",
              bold: currPage > 4,
              coloured: currPage >= 4,
            ),
            IndicatorPageName(
              boxSize: 95.0 * SCALE,
              text: "Explanation",
              bold: currPage > 5,
              coloured: currPage >= 5,
            ),
            IndicatorPageName(
              boxSize: 95.0 * SCALE,
              text: "Follow Up",
              bold: currPage > 6,
              coloured: currPage >= 6,
            ),
            IndicatorPageName(
              boxSize: 95.0 * SCALE,
              text: "Patient plan",
              bold: currPage > 7,
              coloured: currPage >= 7,
            ),
            IndicatorPageName(
              boxSize: 95.0 * SCALE,
              text: "Medical Report",
              bold: currPage > 8,
              coloured: currPage >= 8,
            ),
          ],
        ));
  }
}

class BuildPageIndicator extends StatelessWidget {
  final int pageNum;
  BuildPageIndicator({required this.pageNum});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 1000,
        child: Column(children: [
          PageIndicator(pageNum: pageNum),
          PageIndicatorNames(currPage: pageNum)
        ]));
  }
}
