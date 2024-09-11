import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/pages/MyHealthRecordPage1.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

import 'package:comp30022/components/CustomInputFields.dart';
import 'package:comp30022/components/StatusTray.dart';
import 'package:comp30022/components/StepIndicator.dart';
import 'package:comp30022/components/BackArrowTeal.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';

const double VERTICAL_SPACING = 16;

Builder signUpBody = Builder(builder: (context) {
  return Container(
    color: AppColors.cream, // Matching cream background color
    child: Center(
      child: FractionallySizedBox(
        widthFactor: 0.8, // Set the width to 4/5 of the screen width

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/red_art.png'),
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(width: 20),
                        Text('Personal Details',
                            style: TextStyle(
                              fontSize: 48,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height: 20), // Add more vertical space between sections
              Padding(
                padding: const EdgeInsets.only(bottom: VERTICAL_SPACING),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: DropDown(label: 'Name 1', hintText: 'First')),
                    const SizedBox(width: 16), // Spacing between fields
                    const Expanded(
                        child: TextBox(
                      hintText: "Last",
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: VERTICAL_SPACING),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: DropDown(
                            label: 'DoB 1',
                            hintText: 'Date of birth (dd/mm/yyyy)')),
                    const SizedBox(width: 16), // Spacing between fields
                    Expanded(
                        child: DropDown(label: 'Phone 1', hintText: 'Mobile')),
                  ],
                ),
              ),
              DropDown(label: 'Name 1', hintText: 'Other Names'),
              const SizedBox(height: 20),
              const Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Image(
                          image: AssetImage('assets/images/yellow_art.png'),
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(width: 20),
                        Text('Next of Kin Details',
                            style: TextStyle(
                              fontSize: 48,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height: 20), // Add more vertical space between sections
              Padding(
                  padding: const EdgeInsets.only(bottom: VERTICAL_SPACING),
                  child: Row(
                    children: [
                      Expanded(
                          child: DropDown(
                              label: 'Next of\nKin 1', hintText: 'Full Name')),
                      SizedBox(width: 16), // Spacing between fields
                      Expanded(
                          child: DropDown(label: 'Phone 1', hintText: 'Mobile'))
                    ],
                  )),
              const SizedBox(height: 30),
              Center(
                child: RedActionButton(
                  label: "Add Patient ",
                  iconData: Icons.add_sharp,
                  fontSize: 28,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHealthRecordPage1()),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
});

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "New Patient", pageNum: 1, body: signUpBody);
  }
}
