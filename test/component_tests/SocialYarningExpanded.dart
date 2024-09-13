import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/MedicalHistorySubItem.dart';
import 'package:comp30022/components/yarningCards/SocialYarningExpanded.dart';

void main() {
  testWidgets('SocialYarningCard content displays correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: SocialYarningCardContent(),
      ),
    ));

    expect(find.text('Study and work'), findsOneWidget);
    expect(find.text('Studying or seeking to study?'), findsOneWidget);
    expect(find.text('Working or seeking to work?'), findsOneWidget);
    expect(
        find.byType(Checkbox), findsNWidgets(8)); // 4 rows, 2 checkboxes each

    expect(find.byType(MedicalHistorySubItem), findsNWidgets(8));
  });

  testWidgets('CheckboxFieldWithDetails contains checkboxes and text',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: SocialYarningCardContent(),
      ),
    ));

    expect(find.text('Yes'),
        findsNWidgets(8)); // Each checkbox field has 2 texts "Yes" and "No"
    expect(find.text('No'), findsNWidgets(8));

    expect(
        find.text(
            'Is there enough food to eat? How much veggies, meat, and bread do you eat? What do you usually eat?'),
        findsOneWidget);
  });
}
