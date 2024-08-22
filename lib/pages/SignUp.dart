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
        widthFactor: 0.6, // Set the width to 3/5 of the screen width
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 44),
              Center(
                child: const Text(
                  'Personal Details',
                  style: TextStyle(
                      fontSize: 28, // Larger font size for section headers
                      fontWeight: FontWeight.bold),
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
                        child:
                            DropDown(label: 'NAME 1', hintText: 'FIRST NAME')),
                    const SizedBox(width: 16), // Spacing between fields
                    Expanded(
                        child: TextBox(
                      hintText: "LAST NAME",
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
                            hintText: 'DATE OF BIRTH (dd/mm/yyyy)')),
                    const SizedBox(width: 16), // Spacing between fields
                    Expanded(
                        child: DropDown(
                            label: 'Phone 1', hintText: 'MOBILE NUMBER')),
                  ],
                ),
              ),
              DropDown(label: 'NAME 1', hintText: 'OTHER NAMES'),
              const SizedBox(height: 20),
              Center(
                child: const Text(
                  'Next of Kin Details',
                  style: TextStyle(
                      fontSize: 28, // Larger font size for section headers
                      fontWeight: FontWeight.bold),
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
                              label: 'Next of Kin 1',
                              hintText: 'NEXT OF KIN NAME')),
                      SizedBox(width: 16), // Spacing between fields
                      Expanded(
                          child: DropDown(
                              label: 'Phone 1', hintText: 'MOBILE NUMBER'))
                    ],
                  )),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHealthRecordPage1()),
                    );
                  },
                  child: Text(
                    '+ Add Patient',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.red, // Matching button background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                    elevation: 3, // Add slight shadow for depth
                  ),
                ),
              ),
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
        title: "New Patient Sign Up", pageNum: 1, body: signUpBody);
  }
}
