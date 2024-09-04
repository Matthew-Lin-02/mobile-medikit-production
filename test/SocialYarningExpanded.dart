import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/MedicalHistorySubItem.dart';
import 'package:comp30022/components/yarningCards/SocialYarningExpanded.dart';

void main() {
  testWidgets('SocialYarningCardContent displays correctly',
      (WidgetTester tester) async {
    // Build the widget inside a MaterialApp (to provide Material context)
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: SocialYarningCardContent(),
      ),
    ));

    // Verify that the title "Study and work" is displayed
    expect(find.text('Study and work'), findsOneWidget);

    // Verify that the checkbox titles are displayed
    expect(find.text('Studying or seeking to study?'), findsOneWidget);
    expect(find.text('Working or seeking to work?'), findsOneWidget);

    // Verify that checkboxes are present
    expect(
        find.byType(Checkbox), findsNWidgets(8)); // 4 rows, 2 checkboxes each

    // Verify that the MedicalHistorySubItem widgets are present
    expect(find.byType(MedicalHistorySubItem),
        findsNWidgets(8)); // Based on the provided code
  });

  testWidgets('CheckboxFieldWithDetails contains checkboxes and text',
      (WidgetTester tester) async {
    // Build the widget inside a MaterialApp
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: SocialYarningCardContent(),
      ),
    ));

    // Verify that the checkbox fields contain appropriate text
    expect(find.text('Yes'),
        findsNWidgets(8)); // Each checkbox field has 2 texts "Yes" and "No"
    expect(find.text('No'), findsNWidgets(8));

    // Verify that the correct description is displayed for food availability
    expect(
        find.text(
            'Is there enough food to eat? How much veggies, meat, and bread do you eat? What do you usually eat?'),
        findsOneWidget);
  });
}
