import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';

const double stepIndicatorBoxSize = 95.0;
const double stepIndicatorFontSize = 12.0;

/// This component contains two different varients of the step indicator,
/// the older style from the original Figma design is built using 'BuildPageIndicator()'
/// the new style from the current Figma design is built using 'UpdatedIndicatorStep()'
/// each require the current page number

/// Displays which page the user is currently on and what pages come before and after. (New style)
///
/// Requires 'pageNum' the current page, this is used to colour the indicator.
/// All steps and > (chevrons) before current step are highlighted.
class UpdatedIndicatorStep extends StatelessWidget {
  final int pageNum;

  const UpdatedIndicatorStep({super.key, required this.pageNum});

  @override
  Widget build(BuildContext context) {
    /// Below are each of the steps displayed in the indicator
    /// Additional can be added by adding another '_UpdatedStep()' and adjusting the 'coloured' condition
    return SizedBox(
        width: 1600,
        height: 35,
        child: Row(children: [
          _UpdatedStep(
              text: "Sign Up",
              coloured: pageNum > 0 ? true : false,
              isFirst: true),
          _UpdatedStep(
              text: "Consultation", coloured: pageNum > 1 ? true : false),
          _UpdatedStep(text: "Screening", coloured: pageNum > 2 ? true : false),
          _UpdatedStep(text: "Results", coloured: pageNum > 3 ? true : false),
          _UpdatedStep(
              text: "Next Steps", coloured: pageNum > 4 ? true : false),
          _UpdatedStep(text: "Report", coloured: pageNum > 5 ? true : false),
        ]));
  }
}

/// Creates each of the steps in the indicator (New style)
///
/// Requires 'text' (the step name), 'coloured' (whether the step should be coloured),
/// 'isFirst' (whether the step is the first in the list, prevents drawing a > at the start).
class _UpdatedStep extends StatelessWidget {
  final String text;
  final bool coloured;
  final bool isFirst;

  const _UpdatedStep(
      {required this.text, required this.coloured, this.isFirst = false});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.chevron_right,
          color: coloured ? AppColors.blue : AppColors.blue.withOpacity(0.3),
          size: isFirst ? 0 : mediumFontSize),
      const SizedBox(width: 10),
      Text(text,
          style: TextStyle(
              fontSize: mediumFontSize,
              color:
                  coloured ? AppColors.blue : AppColors.blue.withOpacity(0.3))),
      const SizedBox(width: 10),
    ]);
  }
}

/// Old style below

/// The circles with each of the step numbers (Old style)
///
/// Requires 'stepNum' (the number written in circle), 'step' (the step number),
/// 'currStep' (the current step of the page), 'text' (the name of the step)
class IndicatorStep extends StatelessWidget {
  final String stepNum;
  final int step;
  final int currStep;
  final String text;

  const IndicatorStep(
      {super.key,
      this.stepNum = "00",
      this.step = 0,
      this.currStep = 0,
      this.text = "N/A"});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: 25.0, // Size of the circle
            height: 25.0,
            decoration: BoxDecoration(
                // Draw the circle around the text
                shape: BoxShape.circle,
                color: step >= currStep ? Colors.white : AppColors.mediumBlue,
                border: step <= currStep
                    ? Border.all(color: AppColors.darkBlue, width: 2)
                    : Border.all(color: AppColors.grey, width: 2)),
            child: Center(
                child: Text(
              stepNum,
              style: TextStyle(
                color: step >= currStep ? Colors.black : Colors.white,
                fontSize: stepIndicatorFontSize,
              ),
            ))),
      ],
    );
  }
}

/// Creates a container with text centered within it, also colours and bolds accordingly
///
/// Requires 'text' (name of step), 'boxSize' (size of the container), 'bold' (whether the text should
/// be bolded), 'coloured' (whether the text should be coloured)
class IndicatorPageName extends StatelessWidget {
  final String text;
  final double boxSize;
  final bool bold;
  final bool coloured;

  const IndicatorPageName(
      {super.key,
      required this.boxSize,
      required this.text,
      required this.bold,
      required this.coloured});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: TextStyle(
              fontSize: stepIndicatorFontSize,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: coloured ? AppColors.mediumBlue : AppColors.darkGrey,
            ),
          )),
    );
  }
}

/// The line between each of the circles
class IndicatorLine extends StatelessWidget {
  final bool coloured;
  const IndicatorLine({super.key, required this.coloured});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: //SizedBox(height: 20), // Vertical offset
          SizedBox(
        height: 2,
        width: 400,
        child: ColoredBox(
          color: coloured ? AppColors.mediumBlue : AppColors.grey,
        ),
      ),
    );
  }
}

/// The row that should be called to draw the circles with step numbers
class PageIndicator extends StatelessWidget {
  final int pageNum;
  const PageIndicator({super.key, this.pageNum = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: Row(children: [
          const SizedBox(width: 35),
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
          const SizedBox(width: 35),
        ]));
  }
}

/// Draws the second row with the step names
class PageIndicatorNames extends StatelessWidget {
  final int currPage;

  const PageIndicatorNames({super.key, required this.currPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 20,
        child: Row(
          children: <Widget>[
            IndicatorPageName(
              boxSize: stepIndicatorBoxSize,
              text: "Patient sign up",
              bold: currPage > 1,
              coloured: currPage >= 1,
            ),
            IndicatorPageName(
              boxSize: stepIndicatorBoxSize,
              text: "Consultation",
              bold: currPage > 2,
              coloured: currPage >= 2,
            ),
            IndicatorPageName(
              boxSize: stepIndicatorBoxSize,
              text: "Screening Tools",
              bold: currPage > 3,
              coloured: currPage >= 3,
            ),
            IndicatorPageName(
              boxSize: stepIndicatorBoxSize,
              text: "Results",
              bold: currPage > 4,
              coloured: currPage >= 4,
            ),
            IndicatorPageName(
              boxSize: stepIndicatorBoxSize,
              text: "Explanation",
              bold: currPage > 5,
              coloured: currPage >= 5,
            ),
            IndicatorPageName(
              boxSize: stepIndicatorBoxSize,
              text: "Follow Up",
              bold: currPage > 6,
              coloured: currPage >= 6,
            ),
            IndicatorPageName(
              boxSize: stepIndicatorBoxSize,
              text: "Patient plan",
              bold: currPage > 7,
              coloured: currPage >= 7,
            ),
            IndicatorPageName(
              boxSize: stepIndicatorBoxSize,
              text: "Medical Report",
              bold: currPage > 8,
              coloured: currPage >= 8,
            ),
          ],
        ));
  }
}

/// Creates step indicator colouring all steps before and including current (Old style)
///
/// Requires 'pageNum' the current page number.
class BuildPageIndicator extends StatelessWidget {
  final int pageNum;
  const BuildPageIndicator({super.key, required this.pageNum});

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
