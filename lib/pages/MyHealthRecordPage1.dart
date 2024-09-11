import 'package:comp30022/pages/MyHealthRecordPage2.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/components/BackArrowTeal.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/main.dart';
import 'package:provider/provider.dart';

class MyHealthRecordPage1 extends StatelessWidget {
  const MyHealthRecordPage1({
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
              child: BackArrowTeal(),
            ),
            const SizedBox(height: 50.0),
            const Text(
              "My Health Record",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25.0),
            const Text("Do you have an existing My Health Record?",
                style: TextStyle(fontSize: 16)),
            // SizedBox(height:200.0),
            const SizedBox(height: 300.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RedActionButton(
                  iconData: Icons.check_circle,
                  label: "Yes",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHealthRecordPage2()),
                    );
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
          ]),
        ),
      ),
    );
  }
}
