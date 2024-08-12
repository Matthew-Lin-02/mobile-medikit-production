import 'package:flutter/material.dart';
import 'package:comp30022/components/StatusTray.dart';
import 'package:comp30022/components/StepIndicator.dart';
import 'package:comp30022/main.dart';
import 'package:provider/provider.dart';

const double VERTICAL_SPACING = 16;

Container buildBody(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Container(
      color: Color(0xFFf8dccc), // Matching cream background color
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.6, // Set the width to 3/5 of the screen width
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
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
                          child: CustomInputField(
                              label: 'NAME 1', hintText: 'FIRST NAME')),
                      const SizedBox(width: 16), // Spacing between fields
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
                      const SizedBox(width: 16), // Spacing between fields
                      Expanded(
                          child: CustomInputField(
                              label: 'Phone 1', hintText: 'MOBILE NUMBER')),
                    ],
                  ),
                ),
                CustomInputField(label: 'NAME 1', hintText: 'OTHER NAMES'),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
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
                            child: CustomInputField(
                                label: 'Next of Kin 1',
                                hintText: 'NEXT OF KIN NAME')),
                        SizedBox(width: 16), // Spacing between fields
                        Expanded(
                            child: CustomInputField(
                                label: 'Phone 1', hintText: 'MOBILE NUMBER'))
                      ],
                    )),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: appState.incrementPageNum,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFFD9534F), // Matching button background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0), // Rounded corners
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                      elevation: 3, // Add slight shadow for depth
                    ),
                    child: const Text(
                      '+ Add Patient',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


class PatientSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFf8dccc), // Cream background
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.teal),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              const Text(
                'New Patient Sign Up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          actions: [StatusTray()],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StepIndicator(step: "01", label: "Patient sign up"),
                  SizedBox(width: 20),
                  StepIndicator(step: "02", label: "Consultation"),
                  SizedBox(width: 20),
                  StepIndicator(step: "03", label: "Screening Tools"),
                  SizedBox(width: 20),
                  StepIndicator(step: "04", label: "Results"),
                  SizedBox(width: 20),
                  StepIndicator(step: "05", label: "Explanation"),
                  SizedBox(width: 20),
                  StepIndicator(step: "06", label: "Follow up"),
                  SizedBox(width: 20),
                  StepIndicator(step: "07", label: "Patient plan"),
                  SizedBox(width: 20),
                  StepIndicator(step: "08", label: "Medical report"),
                ],
              ),
            ),
          ),
        ),
        body: buildBody(context));
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
