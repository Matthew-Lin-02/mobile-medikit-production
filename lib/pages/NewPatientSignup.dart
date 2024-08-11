import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

import 'package:comp30022/components/StatusTray.dart';
import 'package:comp30022/components/StepIndicator.dart';

const double VERTICAL_SPACING = 16;

class PatientSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        title: const Text('New Patient Sign Up'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [StatusTray()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StepIndicator(step: "01", label: "Patient sign up"),
                StepIndicator(step: "02", label: "Consultation"),
                StepIndicator(step: "03", label: "Screening Tools"),
                StepIndicator(step: "04", label: "Results"),
                StepIndicator(step: "05", label: "Explanation"),
                StepIndicator(step: "06", label: "Follow up"),
                StepIndicator(step: "07", label: "Patient plan"),
                StepIndicator(step: "08", label: "Medical report"),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Color(0xf8dccc), // Updated cream background color
        child: Center(
          // Center the form
          child: FractionallySizedBox(
            widthFactor: 0.6, // Set the width to 3/5 of the screen width
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    // Center the text
                    child: const Text(
                      'Personal Details',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold), // Increased font size
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: VERTICAL_SPACING),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: CustomInputField(
                                label: 'NAME 1', hintText: 'FIRST NAME')),
                        const SizedBox(
                            width:
                                16), // Add some spacing between fields if needed
                        Expanded(
                            child: CustomTextField(
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
                            child: CustomInputField(
                                label: 'DoB 1',
                                hintText: 'DATE OF BIRTH (dd/mm/yyyy)')),
                        const SizedBox(
                            width:
                                16), // Add some spacing between fields if needed
                        Expanded(
                            child: CustomInputField(
                                label: 'Phone 1', hintText: 'MOBILE NUMBER')),
                      ],
                    ),
                  ),
                  CustomInputField(label: 'NAME 1', hintText: 'OTHER NAMES'),
                  const SizedBox(height: 20),
                  Center(
                    // Center the text
                    child: const Text(
                      'Next of Kin Details',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold), // Increased font size
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.only(bottom: VERTICAL_SPACING),
                      child: Row(
                        children: [
                          Expanded(
                              child: CustomInputField(
                                  label: 'Next of Kin 1',
                                  hintText: 'NEXT OF KIN NAME')),
                          SizedBox(width: 16),
                          Expanded(
                              child: CustomInputField(
                                  label: 'Phone 1', hintText: 'MOBILE NUMBER'))
                        ],
                      )),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        '+ Add Patient',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                            0xFFD9534F), // Updated button background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // Rounded corners
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        elevation: 0, // Remove shadow
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const shadow = BoxShadow(
  color: Colors.grey,
  spreadRadius: 1,
  blurRadius: 2,
  offset: Offset(0, 3),
);

class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;

  CustomInputField({required this.label, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 128,
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(color: Colors.grey.shade800), // border color
            boxShadow: [shadow],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: label,
              onChanged: (String? newValue) {},
              items:
                  <String>[label].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 4.0), // Apply left padding
                    child: Text(
                      value,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                );
              }).toList(),
              icon: Icon(Icons.arrow_drop_down),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: CustomTextField(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;

  CustomTextField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(color: Colors.grey.shade800),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
