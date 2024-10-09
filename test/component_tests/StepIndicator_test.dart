import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/StepIndicator.dart';
import 'package:comp30022/components/BackArrowTeal.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/StatusTray.dart';

void main() {
  testWidgets(
      'IndicatorPageName FittedBox changes size when screen size changes',
      (WidgetTester tester) async {
    // Build the widget under test
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
            body: Row(
          children: [
            IndicatorPageName(
              boxSize: 90,
              text: 'This is an example of a potential page name',
              bold: false,
              coloured: false,
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

  testWidgets('Step indicator displays all names when screen size is 1920x1080',
      (WidgetTester tester) async {
    // Set display size to 1920x1080
    await tester.binding
        .setSurfaceSize(const Size(1920, 1080)); // Large screen size
    await tester.pumpAndSettle();

    // Build the widget under test
    await tester.pumpWidget(
      MaterialApp(
          home: Scaffold(
              body:

                  /// Create duplicate of appbar

                  AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.yellowCream,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(160.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(12.0, 16.0, 0, 0),
                child: Column(children: [
                  SizedBox(height: 11),
                  Row(children: [
                    SizedBox(width: 115),
                    UpdatedIndicatorStep(
                      pageNum: 1,
                    ),
                  ]),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      SizedBox(width: 12),
                      BackArrowTeal(),
                      SizedBox(width: 48),
                      Expanded(
                        child: Text(
                          "Title",
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      //Expanded(child: BuildPageIndicator(pageNum: pageNum)),
                    ],
                  ),
                ]),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: StatusTray(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: 1,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ))),
    );

    /// Check that the different page names are visible on the screen
    expect(find.text('Sign Up').hitTestable(), findsOneWidget);

    expect(find.text('Consultation').hitTestable(), findsOneWidget);

    expect(find.text('Screening').hitTestable(), findsOneWidget);

    expect(find.text('Results').hitTestable(), findsOneWidget);

    expect(find.text('Next Steps').hitTestable(), findsOneWidget);

    expect(find.text('Report').hitTestable(), findsOneWidget);
  });
}
