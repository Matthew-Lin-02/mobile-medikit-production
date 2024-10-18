import 'package:comp30022/components/checkBoxTickTheme.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/components/YellowTextField.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:comp30022/pages/ConsulationComplete.dart';
import 'package:comp30022/styles.dart';
import 'package:flutter/material.dart';

Builder medicalReportBody = Builder(builder: (context) {
  return const Stack(
    children: [
      Positioned(child: MedicalReportContent()),
      Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
    ],
  );
});

class MedicalReportPage extends StatelessWidget {
  const MedicalReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
      title: "Medical Report",
      pageNum: 8,
      body: medicalReportBody,
    );
  }
}

class MedicalReportContent extends StatelessWidget {
  const MedicalReportContent({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    double fieldSpacing = screenHeight * 0.05;

    return ListView(
      children: [
        FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(children: [
              SizedBox(height: fieldSpacing),
              const Align(
                  child: Text(
                      'Below is a generated report of Darlene Pilabar\'s health consultation',
                      style: TextStyle(
                          fontSize: subHeadingFontSize, height: 1.2))),
              SizedBox(height: fieldSpacing),
              const Align(
                  child: Text(
                'Patient details',
                style: TextStyle(fontSize: largeFontSize, height: 1.2),
              )),
              SizedBox(height: fieldSpacing),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GeneratedField(
                    fieldName: 'Patient Name',
                    fieldText: 'Darlene Pilbara',
                    fieldWidth: screenWidth * 0.18,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    fillColor: AppColors.diagnosticGreen,
                  ),
                  GeneratedField(
                    fieldName: 'Patient ID',
                    fieldText: '00000001',
                    fieldWidth: screenWidth * 0.18,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  GeneratedField(
                    fieldName: 'Gender',
                    fieldText: 'Female',
                    fieldWidth: screenWidth * 0.18,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  GeneratedField(
                      fieldName: 'Date of birth',
                      fieldText: '01/01/2001',
                      fieldWidth: screenWidth * 0.18,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      fillColor: AppColors.diagnosticGreen)
                ],
              ),
              SizedBox(height: fieldSpacing),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GeneratedField(
                    fieldName: 'Medical history',
                    fieldText: 'Chest pains',
                    fieldWidth: screenWidth * 0.4,
                    maxLines: 3,
                  ),
                  GeneratedField(
                      fieldName: 'Allergies',
                      fieldText: 'No reported allergies',
                      fieldWidth: screenWidth * 0.4,
                      maxLines: 3)
                ],
              ),
              SizedBox(height: fieldSpacing),
              const Align(
                  child: Text(
                'Consulting worker details',
                style: TextStyle(fontSize: largeFontSize, height: 1.2),
              )),
              SizedBox(height: fieldSpacing),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GeneratedField(
                    fieldName: 'Consultant Name',
                    fieldText: 'Olivia',
                    fieldWidth: screenWidth * 0.18,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  GeneratedField(
                    fieldName: 'Occupation',
                    fieldText: 'Remote area nurse',
                    fieldWidth: screenWidth * 0.18,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  GeneratedField(
                    fieldName: 'Worker ID',
                    fieldText: 'RAN00001',
                    fieldWidth: screenWidth * 0.18,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  GeneratedField(
                    fieldName: 'Date of consult',
                    fieldText: '01/03/2024',
                    fieldWidth: screenWidth * 0.18,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(height: fieldSpacing),
              const Divider(
                color: Colors.black,
                thickness: 3,
              ),
              SizedBox(height: fieldSpacing),
              const Align(
                  child: Text(
                'Medical testing results',
                style: TextStyle(fontSize: largeFontSize, height: 1.2),
              )),
              SizedBox(height: fieldSpacing),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: AppColors.fieldCream,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TestResultsField(
                          title: 'Generate testing results',
                          description:
                              'View observations, temperature and blood pressure results'),
                      TestResultsField(
                          title: 'ECG results',
                          description:
                              'View ECG test results, graph, classification and AI analysis'),
                      TestResultsField(
                          title: 'Urinalysis results',
                          description: 'View urinalysis examination results')
                    ],
                  )),
              SizedBox(height: fieldSpacing),
              const Divider(
                color: Colors.black,
                thickness: 3,
              ),
              SizedBox(height: fieldSpacing),
              const Align(
                  child: Text(
                'Checkup details',
                style: TextStyle(fontSize: largeFontSize, height: 1.2),
              )),
              SizedBox(height: fieldSpacing),
              const EntryField(
                  fieldName: 'Checkup results description',
                  hintText:
                      'Enter healthy if there are no persisting issues, otherwise enter persistent previous medical issues or new recognised issues...'),
              SizedBox(height: fieldSpacing),
              GeneratedField(
                  fieldName: 'Treatment plan',
                  fieldText:
                      'Add a cup of frozen veggies to your meal. Balanced eating helps heal the Heart.\nHave a bushwalk with family, lookout for goanna and emu eggs.',
                  fieldWidth: screenWidth * 0.9),
              SizedBox(height: fieldSpacing),
              const EntryField(
                  fieldName: 'Prescribed medicaiton and instructions of use',
                  hintText: 'Enter here...'),
              SizedBox(height: fieldSpacing),
              const EntryField(
                  fieldName: 'Patient follow up instructions',
                  hintText:
                      'Enter any instructions to give to patient or details about follow up appointment...'),
              SizedBox(height: fieldSpacing),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.fieldCream,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)),
                  child: SizedBox(
                      width: screenWidth * 0.9,
                      child: Row(
                        children: [
                          CheckboxTheme(
                              data: checkBoxTickTheme,
                              child: const CheckboxTick()),
                          const Expanded(
                              child: Text(
                            'I have read this report and agree with the results. Any incorrect results have been amended and I will be held responsible for issues arising from this record',
                            style: TextStyle(fontSize: smallFontSize),
                          ))
                        ],
                      ))),
              SizedBox(height: fieldSpacing),
              Align(
                  alignment: Alignment.bottomRight,
                  child: RedActionButton(
                    label: 'Submit report and complete checkup',
                    iconData: Icons.arrow_forward,
                    size: largeButtonSizeShort,
                    useCircleAvatar: true,
                    iconSize: mediumIconSize,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConsulationComplete(),
                        )),
                  ))
            ])),
        SizedBox(height: fieldSpacing),
        const Image(image: AssetImage('assets/images/art/footer-strip.png')),
      ],
    );
  }
}

class EntryField extends StatelessWidget {
  const EntryField(
      {super.key,
      required this.fieldName,
      required this.hintText,
      this.maxLines});

  final String fieldName;
  final String hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(fontSize: biggishFontSize),
        ),
        YellowTextField(
          hintText: hintText,
          maxLines: maxLines ?? 4,
          fontSize: biggishFontSize,
        )
      ],
    );
  }
}

class GeneratedField extends StatelessWidget {
  const GeneratedField(
      {super.key,
      required this.fieldName,
      required this.fieldText,
      this.maxLines,
      required this.fieldWidth,
      this.textAlign,
      this.fillColor});

  final String fieldName;
  final String fieldText;
  final int? maxLines;
  final double fieldWidth;
  final TextAlign? textAlign;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(fontSize: biggishFontSize),
        ),
        SizedBox(
            width: fieldWidth,
            child: TextField(
              controller: TextEditingController()..text = fieldText,
              textAlign: textAlign ?? TextAlign.start,
              style: const TextStyle(fontSize: biggishFontSize),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  filled: true,
                  fillColor: fillColor ?? AppColors.fieldCream),
              maxLines: maxLines ?? 4,
            ))
      ],
    );
  }
}

class TestResultsField extends StatelessWidget {
  const TestResultsField(
      {super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;

    return SizedBox(
        width: screenWidth * 0.25,
        height: screenHeight * 0.25,
        child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: AppColors.fieldDarkCream,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Expanded(
                    child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: largeFontSize),
                )),
                Expanded(
                    child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: mediumFontSize),
                )),
                const Spacer(),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton.icon(
                          style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(
                                  AppColors.diagnosticGreen)),
                          onPressed: () {},
                          icon: ImageIcon(
                              const AssetImage(
                                  'assets/images/results/test-results-icon.png'),
                              size: screenWidth * 0.015,
                              color: Colors.white),
                          label: const Text(
                            'View results',
                            style: TextStyle(color: Colors.white),
                          ),
                        )))
              ],
            )));
  }
}

class CheckboxTick extends StatefulWidget {
  const CheckboxTick({super.key});

  @override
  State<StatefulWidget> createState() => _CheckboxTickState();
}

class _CheckboxTickState extends State<CheckboxTick> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxTheme(
        data: checkBoxTickTheme,
        child: Checkbox(
          side: const BorderSide(color: Colors.black),
          checkColor: Colors.white,
          activeColor: Colors.black,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ));
  }
}
