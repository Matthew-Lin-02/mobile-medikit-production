import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/StepIndicator.dart'; // Adjust the import to match your file structure

void main() {
  testWidgets(
      'IndicatorPageName FittedBox changes size when screen size changes',
      (WidgetTester tester) async {
    // Build the widget under test
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: Row(
          children: [
            IndicatorPageName(
              boxSize: 90, text: 'This is an example of a potential page name',
              bold: false, coloured: false,

              // Assuming IndicatorPageName takes some parameters; adjust accordingly
            ),
          ],
        )),
      ),
    );
    expect(
        find.text('This is an example of a potential page name').hitTestable(),
        findsOneWidget);

    // Set an initial large screen size
    await tester.binding
        .setSurfaceSize(const Size(600, 1200)); // Large screen size
    await tester.pumpAndSettle();

    // Capture the Text widget for further analysis
    final textFinder = find.byType(FittedBox);

    // Measure the size of the Text widget on the large screen
    final largeScreenTextSize = tester.getSize(textFinder);

    // Verify that the text widget has a non-zero size
    expect(largeScreenTextSize.height, greaterThan(0));
    expect(largeScreenTextSize.width, greaterThan(0));

    // Now, change the screen size to a smaller width
    await tester.binding
        .setSurfaceSize(const Size(300, 600)); // Smaller screen size
    await tester.pumpAndSettle();

    // Measure the size of the Text widget on the smaller screen
    final smallScreenTextSize = tester.getSize(textFinder);

    // Verify that the text widget's size has decreased
    expect(smallScreenTextSize.height, lessThan(largeScreenTextSize.height));
    expect(smallScreenTextSize.width, lessThan(largeScreenTextSize.width));

    // Verify the FittedBox is scaling down the text by comparing the two sizes
    expect(smallScreenTextSize.height,
        lessThanOrEqualTo(largeScreenTextSize.height));
    expect(smallScreenTextSize.width,
        lessThanOrEqualTo(largeScreenTextSize.width));
  });

  testWidgets('UpdatedIndicatorStep displays all of the step names',
      (WidgetTester tester) async {
    // Set display size to 1920x1080
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = Size(1920, 1080);
    // Build the widget under test
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: UpdatedIndicatorStep(pageNum: 1)),
      ),
    );

    expect(find.text('Sign Up').hitTestable(), findsOneWidget);

    expect(find.text('Consultation').hitTestable(), findsOneWidget);

    expect(find.text('Screening').hitTestable(), findsOneWidget);

    expect(find.text('Results').hitTestable(), findsOneWidget);

    expect(find.text('Next Steps').hitTestable(), findsOneWidget);

    expect(find.text('Report').hitTestable(), findsOneWidget);
  });
}
