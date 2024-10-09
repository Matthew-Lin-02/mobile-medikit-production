import 'package:comp30022/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/YellowTextField.dart';

void main() {
  group('StressfulEventsTextField', () {
    testWidgets('shows default hint text', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: YellowTextField(),
          ),
        ),
      );

      // Verify the default hint text is displayed
      expect(find.text('Enter here...'), findsOneWidget);
    });

    testWidgets('shows custom hint text', (WidgetTester tester) async {
      const customHintText = 'Custom Hint Text';

      // Build the widget with custom hint text
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: YellowTextField(hintText: customHintText),
          ),
        ),
      );

      // Verify the custom hint text is displayed
      expect(find.text(customHintText), findsOneWidget);
    });

    testWidgets('has correct maxLines and styling',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: YellowTextField(),
          ),
        ),
      );

      // Verify the text field has 4 max lines
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.maxLines, 4);

      // Verify the text field has the correct fill color
      final decoration = textField.decoration;
      expect(decoration?.filled, isTrue);
      expect(decoration?.fillColor, AppColors.fieldCream);
    });

    testWidgets('renders with specified border', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: YellowTextField(),
          ),
        ),
      );

      // Verify the text field has the correct border
      final textField = tester.widget<TextField>(find.byType(TextField));
      final border = textField.decoration?.border as OutlineInputBorder?;
      expect(border?.borderRadius, BorderRadius.circular(8.0));
      expect(border?.borderSide.color, Colors.black54);
    });
  });

  group('YellowTextField', () {
    testWidgets('has correct default maxLines and styling',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: YellowTextField(),
          ),
        ),
      );

      // Verify the text field has the default maxLines value of 4
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.maxLines, 4);

      // Verify the text field has the correct fill color
      final decoration = textField.decoration;
      expect(decoration?.filled, isTrue);
      expect(decoration?.fillColor, AppColors.fieldCream);
    });

    testWidgets('allows maxLines to be configured',
        (WidgetTester tester) async {
      // Build the widget with a custom maxLines value
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: YellowTextField(maxLines: 6),
          ),
        ),
      );

      // Verify the text field has the custom maxLines value of 6
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.maxLines, 6);
    });
  });
}
