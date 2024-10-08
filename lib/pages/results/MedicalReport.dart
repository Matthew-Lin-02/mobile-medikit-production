import 'dart:math';

import 'package:comp30022/color.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/components/YellowTextField.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
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

    return ListView(
      children: [
        FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(children: [
              const Align(
                  child: Text(
                      'Below is a generated report of Darlene Pilabar\'s health consultation',
                      style: TextStyle(
                          fontSize: subHeadingFontSize, height: 1.2))),
              const Align(
                  child: Text(
                'Patient details',
                style: TextStyle(fontSize: largeFontSize, height: 1.2),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GeneratedField(
                    fieldName: 'Patient Name',
                    fieldText: 'Darlene Pilbara',
                    fieldWidth: screenWidth * 0.18,
                    maxLines: 1,
                    textAlign: TextAlign.center,
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
                  )
                ],
              ),
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
              const Align(
                  child: Text(
                'Consulting worker details',
                style: TextStyle(fontSize: largeFontSize, height: 1.2),
              )),
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
              const Divider(),
              const Align(
                  child: Text(
                'Medical testing results',
                style: TextStyle(fontSize: largeFontSize, height: 1.2),
              )),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      child: Column(
                    children: [
                      Text('Generate testing results'),
                      Text(
                          'View observations, temperature and blood pressure results'),
                      RedActionButton(label: 'View results')
                    ],
                  )),
                  Container(
                      child: Column(
                    children: [
                      Text('ECG results'),
                      Text(
                          'View ECG test results, graph, classification and AI analysis'),
                      RedActionButton(label: 'View results')
                    ],
                  )),
                  Container(
                      child: Column(
                    children: [
                      Text('Urinalysis results'),
                      Text('View urinalysis examination results'),
                      RedActionButton(label: 'View results')
                    ],
                  ))
                ],
              )),
              const Divider(),
              const Align(
                  child: Text(
                'Checkup details',
                style: TextStyle(fontSize: largeFontSize, height: 1.2),
              )),
              const EntryField(
                  fieldName: 'Checkup results description',
                  hintText:
                      'Enter healthy if there are no persisting issues, otherwise enter persistent previous medical issues or new recognised issues...'),
              GeneratedField(
                  fieldName: 'Treatment plan',
                  fieldText:
                      'Add a cup of frozen veggies to your meal. Balanced eating helps heal the Heart.\nHave a bushwalk with family, lookout for goanna and emu eggs.',
                  fieldWidth: screenWidth * 0.9),
              const EntryField(
                  fieldName: 'Prescribed medicaiton and instructions of use',
                  hintText: 'Enter here...'),
              const EntryField(
                  fieldName: 'Patient follow up instructions',
                  hintText:
                      'Enter any instructions to give to patient or details about follow up appointment...'),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFFFF5E1),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Text(
                          'I have read this report and agree with the results. Any incorrect results have been amended and I will be held responsible for issues arising from this record')
                    ],
                  )),
              RedActionButton(
                label: 'Submit report and complete checkup',
                iconData: Icons.arrow_forward,
              )
            ])),
        Image(image: AssetImage('assets/images/art/footer-strip.png')),
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
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class GeneratedField extends StatelessWidget {
  GeneratedField(
      {super.key,
      required this.fieldName,
      required this.fieldText,
      this.maxLines,
      required this.fieldWidth,
      this.textAlign});

  final String fieldName;
  final String fieldText;
  final int? maxLines;
  final double fieldWidth;
  TextAlign? textAlign;

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
              textAlign: textAlign ?? TextAlign.start,
              style: const TextStyle(fontSize: biggishFontSize),
              decoration: InputDecoration(
                  hintText: fieldText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  filled: true,
                  fillColor: Color(0xFFFFF5E1)),
              maxLines: maxLines ?? 4,
            ))
      ],
    );
  }
}
