import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

import 'package:comp30022/components/StatusTray.dart';
import 'package:comp30022/components/StepIndicator.dart';

const double VERTICAL_SPACING = 16;

Container body = Container(
  color: Color(0xFFf8dccc), // Matching cream background color
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
                onPressed: () {},
                child: Text(
                  '+ Add Patient',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
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
              ),
            ),
          ],
        ),
      ),
    ),
  ),
);

class PatientSignUp extends StatelessWidget {
  Widget _buildStepIndicators() {
    const steps = [
      {"step": "01", "label": "Patient sign up"},
      {"step": "02", "label": "Consultation"},
      {"step": "03", "label": "Screening Tools"},
      {"step": "04", "label": "Results"},
      {"step": "05", "label": "Explanation"},
      {"step": "06", "label": "Follow up"},
      {"step": "07", "label": "Patient plan"},
      {"step": "08", "label": "Medical report"},
    ];

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: steps
            .map((step) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: StepIndicator(
                    step: step["step"]!,
                    label: step["label"]!,
                  ),
                ))
            .toList(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false, // Remove the default leading widget
      backgroundColor:
          const Color.fromARGB(255, 248, 228, 196), // Cream background
      elevation: 0, // Remove the default shadow
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(160.0), // Custom height
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  12.0, 16.0, 0, 0), // Adjust padding as needed
              child: Row(
                children: [
                  SizedBox(width: 12),
                  // Teal Circular Back Button
                  Container(
                    width: 64, // Set the width of the circle
                    height:
                        64, // Set the height of the circle (same as width for a perfect circle)
                    decoration: BoxDecoration(
                      color: Colors.teal, // Teal background color
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Light shadow
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      iconSize: 32, // Increase the icon size
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),

                  const SizedBox(width: 48),
                  // Title
                  const Expanded(
                    child: Text(
                      'New Patient Sign Up',
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // StatusTray and Icons
                  _buildStepIndicators()
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Step Indicators
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: StatusTray(), // Place your status tray widget here
              ),
            ]),
            const SizedBox(height: 16),
            // Custom Shadow Line
            Container(
              height: 1, // Height of the divider line
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, // Color of the shadow
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 2), // Position the shadow below the line
                  ),
                ],
              ),
            ),
            // Bottom Icons
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: body);
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
