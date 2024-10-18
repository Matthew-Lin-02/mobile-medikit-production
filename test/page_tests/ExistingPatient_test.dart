import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/Pages.dart';
import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';

Widget buildConfig({
  required String title,
  required int pageNum,
  required Widget body,
  Size size = const Size(1920, 1080),
  double devicePixelRatio = 1.0,
}) {
  TestWidgetsFlutterBinding.ensureInitialized().window.physicalSizeTestValue =
      size;
  TestWidgetsFlutterBinding.ensureInitialized()
      .window
      .devicePixelRatioTestValue = devicePixelRatio;

  return MaterialApp(
    home: AbstractConsultationPage(
      title: title,
      pageNum: pageNum,
      body: body,
    ),
  );
}

void main() {
  testWidgets('PatientLookUp widget test', (WidgetTester tester) async {
    await tester.pumpWidget(buildConfig(
      title: "Existing Patient",
      pageNum: 1,
      body: patientLookUpBody,
    ));

    expect(find.text('Existing Patient'), findsOneWidget);

    expect(find.byType(YellowBorderWhiteCard), findsOneWidget);

    final container = tester.widget<Container>(find.byType(Container).first);
    expect(container.color, AppColors.cream);
  });

  testWidgets('PatientLookUp table header test', (WidgetTester tester) async {
    await tester.pumpWidget(buildConfig(
      title: "Existing Patient",
      pageNum: 1,
      body: patientLookUpBody,
    ));

    // Verify the table headers
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Alias'), findsOneWidget);
    expect(find.text('Date of Birth'), findsOneWidget);
    expect(find.text('Sex'), findsOneWidget);
    expect(find.text('Number'), findsOneWidget);

    // Verify the header style
    final nameText = tester.widget<Text>(find.text('Name'));
    expect(nameText.style?.color, Colors.black);
    expect(nameText.style?.fontSize, largeFontSize);
  });

  testWidgets('PatientLookUp table content text', (WidgetTester tester) async {
    await tester.pumpWidget(buildConfig(
      title: "Existing Patient",
      pageNum: 1,
      body: patientLookUpBody,
    ));

    // Verify the presence of the sample data
    expect(find.text('Darlene Pilbara'), findsOneWidget);
    expect(find.text('N/A'), findsNWidgets(2)); // Two N/A fields
    expect(find.text('01/01/2001'), findsOneWidget);
    expect(find.text('Female'), findsOneWidget);

    // Verify the content style
    final nameText = tester.widget<Text>(find.text('Darlene Pilbara'));
    expect(nameText.style?.fontSize, 22);
  });

  testWidgets('PatientLookUp scrollable test', (WidgetTester tester) async {
    await tester.pumpWidget(buildConfig(
      title: "Existing Patient",
      pageNum: 1,
      body: patientLookUpBody,
    ));

    // Check if scroll view is present
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });

  testWidgets('PatientLookUp layout test', (WidgetTester tester) async {
    await tester.pumpWidget(buildConfig(
      title: "Existing Patient",
      pageNum: 1,
      body: patientLookUpBody,
    ));

    // Verify the YellowBorderWhiteCard dimensions
    final card = tester
        .widget<YellowBorderWhiteCard>(find.byType(YellowBorderWhiteCard));
    expect(card.width, 1718);
    expect(card.height, 600);

    expect(
        find.byType(Table), findsNWidgets(2)); // Header table and content table

    // Verify the table structure
    final table = tester.widget<Table>(find.byType(Table).last);
    expect(table.columnWidths?.length, 5);
    expect(table.columnWidths?[0], isA<FlexColumnWidth>());
    expect((table.columnWidths?[0] as FlexColumnWidth).value, 2);
  });
}
