import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:comp30022/pages/Pages.dart';

void main() {
  group('Patient Look Up Tests', () {
    testWidgets('Displays the correct title', (WidgetTester tester) async {
      // Build the ExistingPatient widget
      await tester.pumpWidget(
        const MaterialApp(
          home: PatientLookUp(),
        ),
      );
      final abstractPage = find.byType(AbstractConsultationPage);
      expect(abstractPage, findsOneWidget);
      final AbstractConsultationPage page = tester.widget(abstractPage);

      // Check the title is displayed
      expect(page.title, equals('Existing Patient'));
    });

    testWidgets('Contains a YellowBorderWhiteCard',
        (WidgetTester tester) async {
      // Build the PatientLookUp widget
      await tester.pumpWidget(
        MaterialApp(
          home: patientLookUpBody,
        ),
      );

      // Check the table is present
      expect(find.byType(YellowBorderWhiteCard), findsOneWidget);
    });

    testWidgets('Table contains the correct headers',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: patientLookUpBody,
        ),
      );

      // Check the table headers are present
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Alias'), findsOneWidget);
      expect(find.text('Date of Birth'), findsOneWidget);
      expect(find.text('Sex'), findsOneWidget);
      expect(find.text('Number'), findsOneWidget);
    });
  });
}
