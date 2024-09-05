import 'package:flutter/material.dart';
import 'package:comp30022/components/ResourceCarousel.dart';
import 'package:comp30022/components/YellowTextField.dart';

class ClinicalDiagnosisYarningCardExpanded extends StatelessWidget {
  ClinicalDiagnosisYarningCardExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Sharing healthcare knowledge and actively listening to patient stories.",
            style:
                TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.5))),
        const Text(
          "Resources",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
            width: 1540,
            child: Column(children: [
              const Text(
                  "Tap for some resources that can help you explain health concepts.",
                  style: TextStyle(fontSize: 18)),
              const SizedBox(
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
                    _ClinicalSubItem(
                      heading: "Medical History",
                      subheading:
                          "Any health related issues the patient is struggling with or has struggled with in the past?",
                      textboxHint:
                          "Have you felt sick before? Can you remember what it felt like?",
                      subsubtext: "",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Does the patient take any regular medications?",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.7))),
                    Text(
                        "(prescribed, over-the-counter, traditional, complementary and alternative)\n",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.5))),
                    Row(children: [
                      const SizedBox(width: 150),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      const Text("Yes", style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 200),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      const Text("No", style: TextStyle(fontSize: 18)),
                    ]),
                    const SizedBox(height: 20),
                    Row(children: [
                      const SizedBox(width: 150),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      const Text("Understanding and adherence checked",
                          style: TextStyle(fontSize: 18)),
                    ]),
                    _ClinicalSubItem(
                      heading: "",
                      subheading: "Details:",
                      textboxHint: "Are you taking any medicine to heal you?",
                      subsubtext: "",
                    ),
                    _ClinicalSubItem(
                      heading: "",
                      subheading:
                          "Does the patient have any allergies or adverse reactions?",
                      textboxHint:
                          "Is there anything you can't eat or touch?\nIs there any food that makes you sick?",
                      subsubtext: "",
                    ),
                    SizedBox(height: 20),
                    _ClinicalSubItem(
                        heading: "Substance Use",
                        subheading:
                            "Quantity and frequency of alcohol and other substance use.",
                        textboxHint:
                            "Do you chew anything to help you relax or make you happy?\nDo you use chewing bingel, Gubnja or tobacco patches?",
                        subsubtext:
                            "eg. Caffeine, cannabis, IVDU, methanphetamine, stimulants, opiates, solvents")
                  ],
                )),
            const SizedBox(width: 60),
            SizedBox(
                width: 700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ClinicalSubItem(
                      heading: "Cardiovascular Health",
                      subheading:
                          "Any problems or details relating to the patient's cardiovascular health.",
                      textboxHint: "Enter here...",
                      subsubtext: "",
                    ),
                    const SizedBox(height: 20),
                    _ClinicalSubItem(
                        heading: "Dental and Eye Health",
                        subheading:
                            "Any problems or details relating to the patient's dental and/or eye health?",
                        textboxHint:
                            "Do you find things hard to see?\nDo things look blurry sometimes?",
                        subsubtext: ""),
                    const SizedBox(height: 20),
                    _ClinicalSubItem(
                        heading: "Oral and Skin Health",
                        subheading:
                            "Any problems or details relating to the patient's oral and/or skin health?",
                        textboxHint:
                            "Does your teeth hurt sometimes?\nIs food hard to eat?\nDoes your skin feel itchy or hurt?",
                        subsubtext: ""),
                    const SizedBox(height: 20),
                    const Text(
                      "\nSmoking",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Row(children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      const Text("Never smoked",
                          style: TextStyle(fontSize: 18)),
                    ]),
                    Row(children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      const Text("Ex-smoker", style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 80),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      const Text("Quit < 12 months",
                          style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 80),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      const Text("Quit ≥ 12 months",
                          style: TextStyle(fontSize: 18)),
                    ]),
                    Row(children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      const Text("Current smoker",
                          style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 42),
                      const Text("How many? ", style: TextStyle(fontSize: 18)),
                      const SizedBox(
                          height: 35,
                          width: 125,
                          child: YellowTextField(hintText: "Enter Here...")),
                      const SizedBox(width: 20),
                      const Text("How long? ", style: TextStyle(fontSize: 18)),
                      SizedBox(
                          height: 35,
                          width: 125,
                          child: YellowTextField(hintText: "Enter Here...")),
                    ]),
                    Row(children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      const Text("Wants to quit",
                          style: TextStyle(fontSize: 18)),
                    ]),
                    Row(children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      const Text("Other tobacco use",
                          style: TextStyle(fontSize: 18)),
                    ]),
                    Row(children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      const Text(
                          "Environmental exposure to tobacco smoke (home, car, etc)",
                          style: TextStyle(fontSize: 18)),
                    ]),
                    Text("\nAdditional Details:",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.7))),
                    YellowTextField(hintText: "Enter here..."),
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

  _ClinicalSubItem(
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
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(subheading,
            style:
                TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7))),
        Text(subsubtext,
            style: TextStyle(
                fontSize: (subsubtext.isNotEmpty ? 18 : 0),
                color: Colors.black.withOpacity(0.5))),
        SizedBox(height: 10),
        YellowTextField(
          hintText: textboxHint,
        ),
      ],
    );
  }
}
