import 'package:flutter/material.dart';
import 'package:comp30022/components/BackArrowWelcomeRow.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/main.dart';
import 'package:provider/provider.dart';

class MyHealthRecordPage2 extends StatelessWidget {
  const MyHealthRecordPage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
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
              child: BackArrow(),
            ),
            const SizedBox(height: 50.0),
            const Text(
              "My Health Record",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25.0),
            const Text("Patient Consent",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 25.0),
            const Text(
                "By accepting I acknowledge that I understand my health data will be stored on My Health Record.",
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 15.0),
            const Text(
                "I understand that I can opt out of sending my data to My Health Records, and in doing so I would"
                "opt out of My Health Record related services",
                style: TextStyle(fontSize: 16)
              ),
              const SizedBox(height: 10.0),
              const Text("Apply for My Health Record (placeholder)",
                style: TextStyle(fontSize: 12)
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RedActionButton(
                      iconData: Icons.check_circle, 
                      label: "Yes", 
                      onPressed: () {
                        print("no more pages");
                      },
                    ),
                    RedActionButton(
                      iconData: Icons.cancel, 
                      label: "No", 
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}
