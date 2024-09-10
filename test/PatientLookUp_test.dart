import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/PatientLookUp.dart';
import 'package:comp30022/components/YellowBorderWhiteCard.dart';

void main() {
  group('Patient Look Up tests', () {
    testWidgets('PatientLookUp displays the correct title',
        (WidgetTester tester) async {
      // Build the PatientLookUp widget
      await tester.pumpWidget(const MaterialApp(home: PatientLookUp()));

      // Check the title is present
      expect(find.text('Existing Patient'), findsOneWidget);
    });

    testWidgets('PatientLookUp contains a YellowBorderWhiteCard table',
        (WidgetTester tester) async {
      // Build the PatientLookUp widget
      await tester.pumpWidget(const MaterialApp(home: PatientLookUp()));

      // Check the table is present
      expect(find.byType(YellowBorderWhiteCard), findsOneWidget);
    });

    testWidgets('PatientLookUp table contains the correct headers',
        (WidgetTester tester) async {
      // Build the PatientLookUp widget
      await tester.pumpWidget(const MaterialApp(home: PatientLookUp()));

      // Check the table headers are present
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Alias'), findsOneWidget);
      expect(find.text('Date of Birth'), findsOneWidget);
      expect(find.text('Sex'), findsOneWidget);
      expect(find.text('Number'), findsOneWidget);
    });
  });
}
