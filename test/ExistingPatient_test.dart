import 'package:comp30022/components/RedActionButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/ExistingPatient.dart';
import 'package:comp30022/components/CustomInputFields.dart';
import 'package:comp30022/pages/PatientLookUp.dart';

void main() {
  testWidgets('Existing Patient displays the correct title and headers',
      (WidgetTester tester) async {
    // Build the ExistingPatient widget
    await tester.pumpWidget(
      const MaterialApp(
        home: ExistingPatient(),
      ),
    );

    // Check the title is displayed
    expect(find.text('Existing Patient'), findsOneWidget);

    // Check the headers are displayed
    expect(find.text('Personal Details'), findsOneWidget);
    expect(find.text('Next of Kin Details'), findsOneWidget);
  });

  testWidgets('Existing Patient displays the correct number of input fields',
      (WidgetTester tester) async {
    // Build the ExistingPatient widget
    await tester.pumpWidget(
      const MaterialApp(
        home: ExistingPatient(),
      ),
    );

    // Check the input fields are displayed
    expect(find.byType(DropDown), findsNWidgets(6));
    expect(find.byType(TextBox), findsNWidgets(7));
  });

  testWidgets('Search button is present in Existing Patient page',
      (WidgetTester tester) async {
    // Build the ExistingPatient widget
    await tester.pumpWidget(
      const MaterialApp(
        home: ExistingPatient(),
      ),
    );

    // Check the Search button is displayed
    expect(find.text('Search'), findsOneWidget);
    expect(find.byType(RedActionButton), findsOneWidget);
  });

  testWidgets('Search button navigates to PatientLookUp page',
      (WidgetTester tester) async {
    // Build the ExistingPatient widget
    await tester.pumpWidget(
      const MaterialApp(
        home: ExistingPatient(),
      ),
    );

    // Tap the Search button
    await tester.tap(find.text('Search'));
    await tester.pumpAndSettle();

    // Check navigation to PatientLookUp page
    expect(find.byType(PatientLookUp), findsOneWidget);
  });
}
