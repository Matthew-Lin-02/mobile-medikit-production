import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

import 'package:comp30022/components/CustomInputFields.dart';
import 'package:comp30022/components/RedActionButton.dart';

const double VERTICAL_SPACING = 16;

class PatientSignIn extends StatelessWidget {
  const PatientSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.cream, // Matching cream background color
        padding: const EdgeInsets.only(top: 115, left: 65, right: 75),
        child: Column(
          children: [
            const Text(
              "Healthy Connections",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: AppColors.turquoise,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Text(
              "Medi-Kit",
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10), // TODO - edit this
              child: Row(children: [
                Expanded(
                  child: Container(
                    height: 60,
                    child: CustomTextField(
                      hintText: 'Username',
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10), // TODO - edit this
              child: Row(children: [
                Expanded(
                  child: Container(
                    height: 60,
                    child: CustomTextField(
                      hintText: 'Password',
                    ),
                  ),
                ),
              ]),
            ),
            const Align(
              alignment: Alignment.center,
              child: RedActionButton(label: "Sign In"),
            ),
            // minimumSize: WidgetStateProperty.all<Size>(Size(95, 95)), // Width, Height
          ],
        ),
      ),
    );
  }
}
