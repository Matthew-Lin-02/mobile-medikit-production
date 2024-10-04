import 'package:comp30022/pages/results/ResultsExplanationPage.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/ChatbotButton.dart';

class ECGResults extends StatelessWidget {
  const ECGResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: ListView(children: [
              const Text(
                'Below are the results of the ECG Test',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: largeFontSize),
              ),
              const Text(
                'Patient\'s graph and normal graph for comparison',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: mediumFontSize),
              ),
              const FractionallySizedBox(
                  widthFactor: 0.75, child: Divider(color: Colors.black)),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    const SizedBox(width: 35),
                    Image.asset("assets/images/results/Normal_ECG.png"),
                    const SizedBox(width: 80)
                  ])),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    const SizedBox(width: 35),
                    Image.asset("assets/images/results/Patients_ECG.png"),
                    const SizedBox(width: 80)
                  ])),
              const SizedBox(height: 40),
              const Text(
                'ECG AI Analysis Results',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: mediumFontSize),
              ),
              const FractionallySizedBox(
                  widthFactor: 0.75, child: Divider(color: Colors.black)),
              const ClassAnalysisButton(
                  imagePath: "assets/images/Touch_Icon.png",
                  iconSpacing: 30,
                  label: "Diagnostic Classes"),
              const SizedBox(height: 100),
              const ClassAnalysisButton(
                  imagePath: "assets/images/Touch_Icon.png",
                  iconSpacing: 60,
                  label: "Rhythm Classes"),
              const SizedBox(height: 100)
            ]))
          ]),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              color: AppColors.cream,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                RedActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResultsExplanationPage()),
                    );
                  },
                  label: "Continue To Patient Education",
                  iconData: Icons.arrow_forward,
                  useCircleAvatar: true,
                  size: mediumButtonSizeLong,
                )
              ]))),
      const Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
      const Positioned(right: 21.0, bottom: 70.0, child: HelpButton()),
    ]);
  }
}

class ClassAnalysisButton extends StatelessWidget {
  const ClassAnalysisButton(
      {super.key,
      required this.imagePath,
      required this.iconSpacing,
      required this.label,
      this.onPressed});

  final VoidCallback? onPressed;
  final String imagePath;
  final double iconSpacing;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: FractionallySizedBox(
            widthFactor: 0.65,
            child: Container(
              padding: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: AppColors.diagnosticGreen,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: Text(
                      textAlign: TextAlign.end,
                      label,
                      style: const TextStyle(
                          color: Colors.white, fontSize: subHeadingFontSize),
                    )),
                    SizedBox(width: iconSpacing),
                    Image(
                      image: AssetImage(imagePath),
                      color: null,
                    ),
                    const SizedBox(width: 340),
                  ]),
            )));
  }
}
