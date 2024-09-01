import 'package:comp30022/pages/Pages.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/CustomInputFields.dart';

const double VERTICAL_SPACING_2 = 16;

Builder existingPatientBody = Builder(builder: (context) {
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
                padding: const EdgeInsets.only(bottom: VERTICAL_SPACING_2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child:
                            DropDown(label: 'NAME 1', hintText: 'FIRST NAME')),
                    const SizedBox(width: 16), // Spacing between fields
                    const Expanded(
                        child: TextBox(
                      hintText: "LAST NAME",
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: VERTICAL_SPACING_2),
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
                  padding: const EdgeInsets.only(bottom: VERTICAL_SPACING_2),
                  child: Row(
                    children: [
                      Expanded(
                          child: DropDown(
                              label: 'Next of Kin 1',
                              hintText: 'NEXT OF KIN NAME')),
                      const SizedBox(width: 16), // Spacing between fields
                      Expanded(
                          child: DropDown(
                              label: 'Phone 1', hintText: 'MOBILE NUMBER'))
                    ],
                  )),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          // TODO - Redirect to PatientLookUp (page not implemented yet)
                          builder: (context) => const MyHealthRecordPage1()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.red, // Matching button background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    elevation: 3, // Add slight shadow for depth
                  ),
                  child: const Text(
                    // TODO - add search icon
                    'Search',
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
});

class ExistingPatient extends StatelessWidget {
  const ExistingPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Existing Patient", pageNum: 1, body: existingPatientBody);
  }
}
