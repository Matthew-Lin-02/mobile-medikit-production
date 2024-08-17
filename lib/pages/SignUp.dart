import 'package:comp30022/pages/MyHealthRecordPage1.dart';
import 'package:flutter/material.dart';

import 'package:comp30022/components/CustomInputFields.dart';
import 'package:comp30022/components/StatusTray.dart';
import 'package:comp30022/components/StepIndicator.dart';

const double VERTICAL_SPACING = 16;

Builder body = Builder(builder: (context) {
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
});

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  final int pageNum = 3;

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
                    child: Builder(builder: (context) {
                      return IconButton(
                        iconSize: 32, // Increase the icon size
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );
                    }),
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
                  // Page indicator
                  Expanded(child: BuildPageIndicator(pageNum: 1)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // StatusTray
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
