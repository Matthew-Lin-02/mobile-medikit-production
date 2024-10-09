import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/pages/results/FollowUpPage.dart';
import 'package:comp30022/pages/results/PatientPlan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';

void main() {
  Widget buildConfig({
    required String title,
    required int pageNum,
    required Widget body,
  }) {
    return MaterialApp(
      home: AbstractConsultationPage(
        title: title,
        pageNum: pageNum,
        body: body,
      ),
    );
  }

  testWidgets("Test all page content loads", (WidgetTester tester) async {
    // Set the test device size and pixel ratio (for a larger device simulation)
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(1920, 1080);

    // Call pump after setting size to ensure changes take effect
    await tester.pumpWidget(buildConfig(
      title: "Patient Plan",
      pageNum: 6,
      body: patientPlanBody,
    ));

    // Check Header contains correct page title
    expect(find.text("Patient Plan"), findsOne);

    // Check for body text content
    expect(find.text("Follow-up Appointment"), findsOne);
    expect(find.text("Yanama!\n\"Keep on going!\""), findsOne);
    expect(find.text("General Practitioner Booking"), findsOne);
    expect(find.text("Selected Recommendations"), findsOne);
    expect(find.text("QR Code to App"), findsOne);
    expect(
        find.text(
            "The companion app will help the patient with adhering to their plan."),
        findsOne);

    // Find QR Code image
    final qrCodeImage = find.byWidgetPredicate((widget) =>
        widget is Image &&
        widget.image is AssetImage &&
        (widget.image as AssetImage).assetName ==
            "assets/images/results/qr-code.png");
    expect(qrCodeImage, findsOneWidget);

    // Find navigation button to next page
    final navigationButton = find.byWidgetPredicate((widget) =>
        widget is RedActionButton &&
        widget.label == "Submit Patient Plan and Generate Medical Report");
    expect(navigationButton, findsOne);
  });

  testWidgets("Test page can be navigated to", (WidgetTester tester) async {
    // Set the test device size and pixel ratio (for a larger device simulation)
    tester.view.devicePixelRatio = 0.5;
    tester.view.physicalSize = const Size(1920, 1080);

    // Call pump after setting size to ensure changes take effect
    await tester.pumpWidget(buildConfig(
      title: "Follow-up",
      pageNum: 6,
      body: followUpPageBody,
    ));

    final navigationButton = find.byWidgetPredicate((widget) =>
        widget is RedActionButton && widget.label == "Create Patient Plan");
    await tester.tap(navigationButton);
    await tester.pumpAndSettle();

    // Check that page title has updated
    expect(find.text("Patient Plan"), findsOne);
  });
}
