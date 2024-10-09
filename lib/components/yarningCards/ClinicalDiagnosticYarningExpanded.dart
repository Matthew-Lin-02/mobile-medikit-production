import 'package:comp30022/font.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/components/ResourceCarousel.dart';
import 'package:comp30022/components/YellowTextField.dart';

const double yarningSubHeadingFontSize = 18.0;

class ClinicalDiagnosisYarningCardExpanded extends StatefulWidget {
  const ClinicalDiagnosisYarningCardExpanded({super.key});

  @override
  _ClinicalDiagnosisYarningCardExpandedState createState() =>
      _ClinicalDiagnosisYarningCardExpandedState();
}

class _ClinicalDiagnosisYarningCardExpandedState
    extends State<ClinicalDiagnosisYarningCardExpanded> {
  // Dictionary for checkbox state
  Map<String, bool> checkboxStates = {
    'medicalCheckbox1': false,
    'medicalCheckbox2': false,
    'understandingCheckbox': false,
    'neverSmokedCheckbox': false,
    'exSmokerCheckbox': false,
    'quitLessThan12MonthsCheckbox': false,
    'quitMoreThan12MonthsCheckbox': false,
    'currentSmokerCheckbox': false,
    'wantsToQuitCheckbox': false,
    'otherTobaccoCheckbox': false,
    'environmentalExposureCheckbox': false,
  };

  void updateCheckbox(String key, bool? value) {
    setState(() {
      checkboxStates[key] = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sharing healthcare knowledge and actively listening to patient stories.",
          style: TextStyle(
              fontSize: extraSmallFontSize,
              color: Colors.black.withOpacity(0.5)),
        ),
        const Text(
          "Resources",
          style:
              TextStyle(fontSize: largeFontSize, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
            width: 1540,
            child: Column(children: [
              Text(
                  "Tap for some resources that can help you explain health concepts.",
                  style: TextStyle(fontSize: extraSmallFontSize)),
              SizedBox(
                height: 20,
              ),
              ResourceCarousel(),
            ])),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            SizedBox(
                width: 700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Left Column
                  children: [
                    const _ClinicalSubItem(
                      heading: "Medical History",
                      subheading:
                          "Any health related issues the patient is struggling with or has struggled with in the past?",
                      textboxHint:
                          "Have you felt sick before? Can you remember what it felt like?",
                      subsubtext: "",
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Does the patient take any regular medications?",
                      style: TextStyle(
                          fontSize: extraSmallFontSize,
                          color: Colors.black.withOpacity(0.7)),
                    ),
                    Text(
                      "(prescribed, over-the-counter, traditional, complementary and alternative)\n",
                      style: TextStyle(
                          fontSize: extraSmallFontSize,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    Row(children: [
                      const SizedBox(width: 150),
                      Checkbox(
                        value: checkboxStates['medicalCheckbox1'],
                        onChanged: (bool? value) {
                          updateCheckbox('medicalCheckbox1', value);
                        },
                      ),
                      const Text("Yes",
                          style: TextStyle(fontSize: extraSmallFontSize)),
                      const SizedBox(width: 200),
                      Checkbox(
                        value: checkboxStates['medicalCheckbox2'],
                        onChanged: (bool? value) {
                          updateCheckbox('medicalCheckbox2', value);
                        },
                      ),
                      const Text("No",
                          style: TextStyle(fontSize: extraSmallFontSize)),
                    ]),
                    const SizedBox(height: 20),
                    Row(children: [
                      const SizedBox(width: 150),
                      Checkbox(
                        value: checkboxStates['understandingCheckbox'],
                        onChanged: (bool? value) {
                          updateCheckbox('understandingCheckbox', value);
                        },
                      ),
                      const Text("Understanding and adherence checked",
                          style: TextStyle(fontSize: extraSmallFontSize)),
                    ]),
                    const _ClinicalSubItem(
                      heading: "",
                      subheading: "Details:",
                      textboxHint: "Are you taking any medicine to heal you?",
                      subsubtext: "",
                    ),
                    // Other items...
                  ],
                )),
            const SizedBox(width: 60),
            SizedBox(
                width: 700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Right Column
                    const _ClinicalSubItem(
                      heading: "Cardiovascular Health",
                      subheading:
                          "Any problems or details relating to the patient's cardiovascular health.",
                      textboxHint: "Enter here...",
                      subsubtext: "",
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "\nSmoking",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Row(children: [
                      Checkbox(
                        value: checkboxStates['neverSmokedCheckbox'],
                        onChanged: (bool? value) {
                          updateCheckbox('neverSmokedCheckbox', value);
                        },
                      ),
                      const Text("Never smoked",
                          style: TextStyle(fontSize: extraSmallFontSize)),
                    ]),
                    Row(children: [
                      Checkbox(
                        value: checkboxStates['exSmokerCheckbox'],
                        onChanged: (bool? value) {
                          updateCheckbox('exSmokerCheckbox', value);
                        },
                      ),
                      const Text("Ex-smoker",
                          style: TextStyle(fontSize: extraSmallFontSize)),
                      const SizedBox(width: 80),
                      Checkbox(
                        value: checkboxStates['quitLessThan12MonthsCheckbox'],
                        onChanged: (bool? value) {
                          updateCheckbox('quitLessThan12MonthsCheckbox', value);
                        },
                      ),
                      const Text("Quit < 12 months",
                          style: TextStyle(fontSize: extraSmallFontSize)),
                      const SizedBox(width: 80),
                      Checkbox(
                        value: checkboxStates['quitMoreThan12MonthsCheckbox'],
                        onChanged: (bool? value) {
                          updateCheckbox('quitMoreThan12MonthsCheckbox', value);
                        },
                      ),
                      const Text("Quit ≥ 12 months",
                          style: TextStyle(fontSize: extraSmallFontSize)),
                    ]),
                    Row(children: [
                      Checkbox(
                        value: checkboxStates['currentSmokerCheckbox'],
                        onChanged: (bool? value) {
                          updateCheckbox('currentSmokerCheckbox', value);
                        },
                      ),
                      const Text("Current smoker",
                          style: TextStyle(fontSize: extraSmallFontSize)),
                      const SizedBox(width: 42),
                      const Text("How many? ",
                          style: TextStyle(fontSize: extraSmallFontSize)),
                      const SizedBox(
                          height: 43,
                          width: 125,
                          child: YellowTextField(hintText: "Enter Here...")),
                      const SizedBox(width: 20),
                      const Text("How long? ",
                          style: TextStyle(fontSize: extraSmallFontSize)),
                      const SizedBox(
                          height: 43,
                          width: 125,
                          child: YellowTextField(hintText: "Enter Here...")),
                    ]),
                    Row(children: [
                      Checkbox(
                        value: checkboxStates['wantsToQuitCheckbox'],
                        onChanged: (bool? value) {
                          updateCheckbox('wantsToQuitCheckbox', value);
                        },
                      ),
                      const Text("Wants to quit",
                          style: TextStyle(fontSize: extraSmallFontSize)),
                    ]),
                    Row(children: [
                      Checkbox(
                        value: checkboxStates['otherTobaccoCheckbox'],
                        onChanged: (bool? value) {
                          updateCheckbox('otherTobaccoCheckbox', value);
                        },
                      ),
                      const Text("Other tobacco use",
                          style: TextStyle(fontSize: extraSmallFontSize)),
                    ]),
                    Row(children: [
                      Checkbox(
                        value: checkboxStates['environmentalExposureCheckbox'],
                        onChanged: (bool? value) {
                          updateCheckbox(
                              'environmentalExposureCheckbox', value);
                        },
                      ),
                      const Text(
                          "Environmental exposure to tobacco smoke (home, car, etc)",
                          style: TextStyle(fontSize: extraSmallFontSize)),
                    ]),
                  ],
                ))
          ],
        )
      ],
    );
  }
}

class _ClinicalSubItem extends StatelessWidget {
  final String heading;
  final String subheading;
  final String textboxHint;
  final String subsubtext;

  const _ClinicalSubItem(
      {required this.heading,
      required this.subheading,
      required this.textboxHint,
      required this.subsubtext});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(subheading,
            style: TextStyle(
                fontSize: extraSmallFontSize,
                color: Colors.black.withOpacity(0.7))),
        Text(subsubtext,
            style: TextStyle(
                fontSize: (subsubtext.isNotEmpty ? extraSmallFontSize : 0),
                color: Colors.black.withOpacity(0.5))),
        const SizedBox(height: 10),
        YellowTextField(
          hintText: textboxHint,
        ),
      ],
    );
  }
}
