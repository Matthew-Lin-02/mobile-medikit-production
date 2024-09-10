import 'package:comp30022/components/RedActionButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/ExistingPatient.dart';
import 'package:comp30022/components/CustomInputFields.dart';
import 'package:comp30022/pages/PatientLookUp.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';

void main() {
  group('Existing Patient Tests', () {
    testWidgets('Displays the correct title', (WidgetTester tester) async {
      // Build the ExistingPatient widget
      await tester.pumpWidget(
        const MaterialApp(
          home: ExistingPatient(),
        ),
      );
      final abstractPage = find.byType(AbstractConsultationPage);
      expect(abstractPage, findsOneWidget);
      final AbstractConsultationPage page = tester.widget(abstractPage);

      // Check the title is displayed
      expect(page.title, equals('Existing Patient'));
    });

    testWidgets('Displays the correct title and headers',
        (WidgetTester tester) async {
      // Build the ExistingPatient widget
      await tester.pumpWidget(
        MaterialApp(
          home: existingPatientBody,
        ),
      );

      // Check the headers are displayed
      expect(find.text('Personal Details'), findsOneWidget);
      expect(find.text('Next of Kin Details'), findsOneWidget);
    });

    testWidgets('Displays the correct number of input fields',
        (WidgetTester tester) async {
      // Build the ExistingPatient widget
      await tester.pumpWidget(
        MaterialApp(
          home: existingPatientBody,
        ),
      );

      // Check the input fields are displayed
      expect(find.byType(DropDown), findsNWidgets(6));
      expect(find.byType(TextBox), findsNWidgets(7));
    });

    testWidgets('Displays Search button', (WidgetTester tester) async {
      // Build the ExistingPatient widget
      await tester.pumpWidget(
        MaterialApp(
          home: existingPatientBody,
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
        MaterialApp(
          home: existingPatientBody,
        ),
      );

      // Tap the Search button
      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      // Check navigation to PatientLookUp page
      expect(find.byType(PatientLookUp), findsOneWidget);
    });
  });
}
