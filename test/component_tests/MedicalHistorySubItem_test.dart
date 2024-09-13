import 'package:comp30022/components/MedicalHistorySubItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MedicalHistorySubItem Widget', () {
    const title = 'Cardiovascular Health';
    const description =
        'Any problems or details relating to the patient\'s cardiovascular health.';
    const hintText = 'Enter here...';

    testWidgets('displays the title correctly', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MedicalHistorySubItem(
              title: title,
              description: description,
              hintText: hintText,
            ),
          ),
        ),
      );

      // Verify the title is displayed
      expect(find.text(title), findsOneWidget);
    });

    testWidgets('displays the description correctly',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MedicalHistorySubItem(
              title: title,
              description: description,
              hintText: hintText,
            ),
          ),
        ),
      );

      // Verify the description is displayed
      expect(find.text(description), findsOneWidget);
    });

    testWidgets('displays the correct hint text in YellowTextField',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MedicalHistorySubItem(
              title: title,
              description: description,
              hintText: hintText,
            ),
          ),
        ),
      );

      // Verify the hint text in YellowTextField is correct
      expect(find.text(hintText), findsOneWidget);
    });

    testWidgets('uses default hint text if not provided',
        (WidgetTester tester) async {
      // Build the widget without providing hintText
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MedicalHistorySubItem(
              title: title,
              description: description,
            ),
          ),
        ),
      );

      // Verify the default hint text 'Enter here...' is displayed
      expect(find.text('Enter here...'), findsOneWidget);
    });
  });
}
