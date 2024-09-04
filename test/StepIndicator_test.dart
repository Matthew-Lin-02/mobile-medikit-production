import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/StepIndicator.dart'; // Adjust the import to match your file structure

void main() {
  testWidgets(
      'IndicatorPageName text scales with FittedBox when screen size changes',
      (WidgetTester tester) async {
    // Build the widget under test
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: IndicatorPageName(
            boxSize: 90, text: 'SampleText', bold: false, coloured: false,

            // Assuming IndicatorPageName takes some parameters; adjust accordingly
          ),
        ),
      ),
    );

    // Set an initial large screen size
    await tester.binding
        .setSurfaceSize(const Size(600, 1200)); // Large screen size
    await tester.pumpAndSettle();

    // Capture the Text widget for further analysis
    final textFinder = find.byType(Text);
    final textWidget = tester.firstWidget<Text>(textFinder);

    // Measure the size of the Text widget on the large screen
    final largeScreenBox = tester.renderObject<RenderBox>(textFinder);
    final largeScreenTextSize = largeScreenBox.size;

    // Verify that the text widget has a non-zero size
    expect(largeScreenTextSize.height, greaterThan(0));
    expect(largeScreenTextSize.width, greaterThan(0));

    // Now, change the screen size to a smaller width
    await tester.binding
        .setSurfaceSize(const Size(300, 600)); // Smaller screen size
    await tester.pumpAndSettle();

    // Measure the size of the Text widget on the smaller screen
    final smallScreenBox = tester.renderObject<RenderBox>(textFinder);
    final smallScreenTextSize = smallScreenBox.size;

    // Verify that the text widget's size has decreased
    expect(smallScreenTextSize.height, lessThan(largeScreenTextSize.height));
    expect(smallScreenTextSize.width, lessThan(largeScreenTextSize.width));

    // Verify the FittedBox is scaling down the text by comparing the two sizes
    expect(smallScreenTextSize.height,
        lessThanOrEqualTo(largeScreenTextSize.height));
    expect(smallScreenTextSize.width,
        lessThanOrEqualTo(largeScreenTextSize.width));
  });
}
