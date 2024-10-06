import 'package:comp30022/components/StandaloneFunctions.dart';
import 'package:comp30022/pages/results/ResultsExplanationPage.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/components/YellowBorderWhiteCard.dart';

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
                    Image.asset("assets/images/Normal_ECG.png"),
                    const SizedBox(width: 80)
                  ])),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    const SizedBox(width: 35),
                    Image.asset("assets/images/Patients_ECG.png"),
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
              ClassAnalysisButton(
                  onPressed: () {
                    showCustomModal(context, const DiagnosticOverlay());
                  },
                  imagePath: "assets/images/Touch_Icon.png",
                  iconSpacing: 30,
                  label: "Diagnostic Classes"),
              const SizedBox(height: 100),
              ClassAnalysisButton(
                  onPressed: () {
                    showCustomModal(
                        context,
                        const RhythmOverlay(
                          detectedClass: 'AFIB',
                        ));
                  },
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

class DiagnosticOverlay extends StatelessWidget {
  const DiagnosticOverlay({super.key, this.detectedClass});

  final String? detectedClass;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: 0.8,
        child: Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: AppColors.cream,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ListView(
              children: [
                const Text(
                  "ECG AI Diagnostic Classes Results",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: largeFontSize),
                ),
                const FractionallySizedBox(
                    widthFactor: 0.8, child: Divider(color: Colors.black)),
                FractionallySizedBox(
                  widthFactor: 0.75,
                  child: YellowBorderWhiteCard(
                      child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NORM',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: mediumFontSize,
                                  height: 2.0),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'MI',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: mediumFontSize,
                                  height: 2.0),
                            ),
                            AnalysisClassText('AMI', detectedClass),
                            AnalysisClassText('IMI', detectedClass),
                            AnalysisClassText('LMI', detectedClass),
                            AnalysisClassText('PMI', detectedClass),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'STTC',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: mediumFontSize,
                                  height: 2.0),
                            ),
                            AnalysisClassText('ISCA', detectedClass),
                            AnalysisClassText('ISCI', detectedClass),
                            AnalysisClassText('ISC_', detectedClass),
                            AnalysisClassText('STTC', detectedClass),
                            AnalysisClassText('NST', detectedClass),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'CD',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: mediumFontSize,
                                  height: 2.0),
                            ),
                            AnalysisClassText('LAFB/LPFB', detectedClass),
                            AnalysisClassText('IRBBB', detectedClass),
                            AnalysisClassText('IVCD', detectedClass),
                            AnalysisClassText('_AVB', detectedClass),
                            AnalysisClassText('CRBBB', detectedClass),
                            AnalysisClassText('CLBBB', detectedClass),
                            AnalysisClassText('WPW', detectedClass),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'HYP',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: mediumFontSize,
                                  height: 2.0),
                            ),
                            AnalysisClassText('LVH', detectedClass),
                            AnalysisClassText('LAO/LAE', detectedClass),
                            AnalysisClassText('RVH', detectedClass),
                            AnalysisClassText('RAO/RAE', detectedClass),
                            AnalysisClassText('SEHYP', detectedClass),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 50)
                  ])),
                ),
                const SizedBox(height: 20),
                const FractionallySizedBox(
                    widthFactor: 0.9,
                    child: YellowBorderWhiteCard(
                        child: Text(
                      'No diagnostic class detection made, see rhythm classes',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: subHeadingFontSize),
                    )))
              ],
            )));
  }
}

class RhythmOverlay extends StatelessWidget {
  const RhythmOverlay({super.key, this.detectedClass});

  final String? detectedClass;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: 0.8,
        child: Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: AppColors.cream,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(children: [
              ListView(
                children: [
                  const Text(
                    "ECG AI Diagnostic Classes Results",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: largeFontSize),
                  ),
                  const FractionallySizedBox(
                      widthFactor: 0.8, child: Divider(color: Colors.black)),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: YellowBorderWhiteCard(
                        child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              AnalysisClassText('SR', detectedClass),
                              AnalysisClassText('AFIB', detectedClass),
                              AnalysisClassText('STACH', detectedClass),
                              AnalysisClassText('SARRH', detectedClass),
                              AnalysisClassText('SBRAD', detectedClass),
                            ],
                          ),
                          Column(
                            children: [
                              AnalysisClassText('SVARR', detectedClass),
                              AnalysisClassText('TRIGU', detectedClass),
                              AnalysisClassText('BIGU', detectedClass),
                              AnalysisClassText('AFLT', detectedClass),
                              AnalysisClassText('SVTAC', detectedClass),
                              AnalysisClassText('PSVT', detectedClass),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 50)
                    ])),
                  ),
                  const SizedBox(height: 20),
                  const FractionallySizedBox(
                      widthFactor: 0.9,
                      child: YellowBorderWhiteCard(
                          child: Text(
                        'No rhytm class detection made, see diagnostic classes',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: subHeadingFontSize),
                      )))
                ],
              ),
              const Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(
                    Icons.close,
                    color: Colors.red,
                  ))
            ])));
  }
}

class AnalysisClassText extends StatelessWidget {
  final String text;
  final String? detectedClass;

  const AnalysisClassText(this.text, this.detectedClass, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: mediumFontSize,
            height: 1.8,
            color: (detectedClass == text) ? Colors.red : Colors.black));
  }
}
