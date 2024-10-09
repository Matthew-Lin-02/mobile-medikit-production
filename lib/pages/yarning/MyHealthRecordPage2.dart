import 'package:comp30022/pages/yarning/GuidedConsultation.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/components/BackArrowTeal.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/font.dart';

class MyHealthRecordPage2 extends StatelessWidget {
  const MyHealthRecordPage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 65,
          right: 75,
          bottom: 30,
        ),
        child: Center(
          child: Column(children: [
            const Align(
              alignment: Alignment.topLeft,
              child: BackArrowTeal(),
            ),
            const SizedBox(height: 50.0),
            const Text(
              "My Health Record",
              style: TextStyle(
                  fontSize: largeHeadingFontSize, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25.0),
            const Text("Patient Consent",
                style: TextStyle(
                    fontSize: subHeadingFontSize, fontWeight: FontWeight.bold)),
            const SizedBox(height: 25.0),
            const Text(
                "By accepting I acknowledge that I understand my health data will be stored on My Health Record.",
                style: TextStyle(fontSize: largeFontSize),
                textAlign: TextAlign.center),
            const SizedBox(height: 15.0),
            const Text(
                "I understand that I can opt out of sending my data to My Health Records, and in doing so I would"
                "opt out of My Health Record related services",
                style: TextStyle(fontSize: largeFontSize),
                textAlign: TextAlign.center),
            const SizedBox(height: 10.0),
            const Text("Apply for My Health Record",
                style: TextStyle(fontSize: largeFontSize)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RedActionButton(
                  iconData: Icons.check_circle,
                  label: "Yes",
                  size: mediumButtonSize,
                  fontSize: largeFontSize,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GuidedConsultation()),
                    );
                  },
                ),
                RedActionButton(
                  iconData: Icons.cancel,
                  label: "No",
                  size: mediumButtonSize,
                  fontSize: largeFontSize,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 100.0),
          ]),
        ),
      ),
    );
  }
}
