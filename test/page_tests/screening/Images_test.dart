import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:comp30022/pages/screening/ThroatSnapshotAnalysis.dart';
import 'package:comp30022/pages/screening/Images.dart';
import 'package:comp30022/pages/screening/SkinSnapshotAnalysis.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/screening/Snapshot.dart';
import 'package:comp30022/components/RedActionButton.dart';

void main() {
  Widget buildConfig({
    required String title,
    required int pageNum,
    required Widget body,
    Size size = const Size(1920, 1080),
    double devicePixelRatio = 1.0,
  }) {
    const testScreenSize = Size(1920, 1080);
    TestWidgetsFlutterBinding.ensureInitialized().window.physicalSizeTestValue =
        size;
    TestWidgetsFlutterBinding.ensureInitialized()
        .window
        .devicePixelRatioTestValue = devicePixelRatio;

    return MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(size: testScreenSize),
        child: AbstractConsultationPage(
          title: title,
          pageNum: pageNum,
          body: body,
        ),
      ),
    );
  }

  group('Images Page', () {
    testWidgets('displays and can click both Skin and Throat Analysis tabs',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildConfig(
        title: 'Images',
        pageNum: 3,
        body: const Images(),
      ));

      await tester.tap(find.text('Throat Snapshot Analysis'));
      await tester.pumpAndSettle();

      expect(find.byType(ThroatSnapshotAnalysis), findsOneWidget);
      await tester.tap(find.text('Skin Snapshot Analysis'));
      await tester.pumpAndSettle();

      expect(find.byType(SkinSnapshotAnalysis), findsOneWidget);
    });

    testWidgets('displays Chat Bot Button', (WidgetTester tester) async {
      await tester.pumpWidget(buildConfig(
        title: 'Images',
        pageNum: 3,
        body: const Images(),
      ));

      expect(find.byType(ChatBotButton), findsOneWidget);
    });
  });

  group('Throat Snapshot Analysis', () {
    testWidgets('displays the red action button correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ThroatSnapshotAnalysis(),
          ),
        ),
      );

      expect(find.byType(RedActionButton), findsOneWidget);
      expect(find.text('Back to Screening Tools'), findsOneWidget);
      await tester.tap(find.text('Back to Screening Tools'));
      await tester.pumpAndSettle();
    });

    testWidgets('displays the snapshot camera icon',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(buildConfig(
        title: 'Images',
        pageNum: 3,
        body: const Images(),
      ));

      await tester.tap(find.text('Throat Snapshot Analysis'));
      await tester.pumpAndSettle();
      expect(find.byType(ThroatSnapshotAnalysis), findsOneWidget);

      // Find the camera icon and tap it
      expect(find.byType(CameraIcon), findsOneWidget);
      await tester.tap(find.byType(CameraIcon));
    });

    testWidgets(
        'snapshot submitted overlay displays correctly and can be dismissed',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(buildConfig(
        title: 'Images',
        pageNum: 3,
        body: const Images(),
      ));

      await tester.tap(find.text('Throat Snapshot Analysis'));
      await tester.pumpAndSettle();
      expect(find.byType(ThroatSnapshotAnalysis), findsOneWidget);

      // Find the camera icon and tap it
      expect(find.byIcon(Icons.camera_alt), findsOneWidget);
      await tester.tap(find.byIcon(Icons.camera_alt));
      await tester.pumpAndSettle();
      // Expect the overlay to be displayed
      expect(find.byType(ThroatSnapshotOverlay), findsOneWidget);

      // Tap the submit button
      expect(find.byType(RedActionButton), findsWidgets);
      expect(find.text('Submit Snapshot'), findsOneWidget);
      await tester.tap(find.text('Submit Snapshot'));
      await tester.pumpAndSettle();
      expect(find.byType(SnapshotSubmitted), findsOneWidget);

      // Tap outside the overlay to close it
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();
      expect(find.byType(SnapshotSubmitted), findsNothing);
    });

    testWidgets('snapshot overlay displays correctly and can be dismissed',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(buildConfig(
        title: 'Images',
        pageNum: 3,
        body: const Images(),
      ));
      await tester.tap(find.text('Throat Snapshot Analysis'));
      await tester.pumpAndSettle();
      expect(find.byType(ThroatSnapshotAnalysis), findsOneWidget);

      // Find the camera icon and tap it
      expect(find.byIcon(Icons.camera_alt), findsOneWidget);
      await tester.tap(find.byIcon(Icons.camera_alt));
      await tester.pumpAndSettle();

      // Tap outside the overlay to close it
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();
      expect(find.byType(ThroatSnapshotOverlay), findsNothing);
    });

    testWidgets('displays the help button and help button contents',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildConfig(
        title: 'Images',
        pageNum: 3,
        body: const Images(),
      ));

      // Tap the Throat Snapshot Analysis tab
      await tester.tap(find.text('Throat Snapshot Analysis'));
      await tester.pumpAndSettle();
      expect(find.byType(HelpButton), findsOneWidget);

      // Tap the help button
      await tester.tap(find.byType(HelpButton));
      await tester.pumpAndSettle();
      expect(find.byType(ThroatHelp), findsOneWidget);

      // Tap outside the overlay to close it
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();
      expect(find.byType(ThroatHelp), findsNothing);
    });
  });

  group('Skin Snapshot Analysis', () {
    testWidgets('displays the red action button correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkinSnapshotAnalysis(),
          ),
        ),
      );

      expect(find.byType(RedActionButton), findsOneWidget);
      expect(find.text('Back to Screening Tools'), findsOneWidget);
      await tester.tap(find.text('Back to Screening Tools'));
      await tester.pumpAndSettle();
    });

    testWidgets('displays the snapshot camera icon',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(buildConfig(
        title: 'Images',
        pageNum: 3,
        body: const Images(),
      ));

      await tester.tap(find.text('Skin Snapshot Analysis'));
      await tester.pumpAndSettle();
      expect(find.byType(SkinSnapshotAnalysis), findsOneWidget);

      // Find the camera icon and tap it
      expect(find.byType(CameraIcon), findsOneWidget);
      await tester.tap(find.byType(CameraIcon));
    });

    testWidgets(
        'snapshot submitted overlay displays correctly and can be dismissed',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(buildConfig(
        title: 'Images',
        pageNum: 3,
        body: const Images(),
      ));

      await tester.tap(find.text('Skin Snapshot Analysis'));
      await tester.pumpAndSettle();
      expect(find.byType(SkinSnapshotAnalysis), findsOneWidget);

      // Find the camera icon and tap it
      expect(find.byIcon(Icons.camera_alt), findsOneWidget);
      await tester.tap(find.byIcon(Icons.camera_alt));
      await tester.pumpAndSettle();
      // Expect the overlay to be displayed
      expect(find.byType(SkinSnapshotOverlay), findsOneWidget);

      // Tap the submit button
      expect(find.byType(RedActionButton), findsWidgets);
      expect(find.text('Submit Snapshot'), findsOneWidget);
      await tester.tap(find.text('Submit Snapshot'));
      await tester.pumpAndSettle();
      expect(find.byType(SnapshotSubmitted), findsOneWidget);

      // Tap outside the overlay to close it
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();
      expect(find.byType(SnapshotSubmitted), findsNothing);
    });

    testWidgets('snapshot overlay displays correctly and can be dismissed',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(buildConfig(
        title: 'Images',
        pageNum: 3,
        body: const Images(),
      ));
      await tester.tap(find.text('Skin Snapshot Analysis'));
      await tester.pumpAndSettle();
      expect(find.byType(SkinSnapshotAnalysis), findsOneWidget);

      // Find the camera icon and tap it
      expect(find.byIcon(Icons.camera_alt), findsOneWidget);
      await tester.tap(find.byIcon(Icons.camera_alt));
      await tester.pumpAndSettle();

      // Tap outside the overlay to close it
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();
      expect(find.byType(SkinSnapshotOverlay), findsNothing);
    });

    testWidgets('displays the help button and help button contents',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildConfig(
        title: 'Images',
        pageNum: 3,
        body: const Images(),
      ));

      // Tap the Skin Snapshot Analysis tab
      await tester.tap(find.text('Skin Snapshot Analysis'));
      await tester.pumpAndSettle();
      expect(find.byType(HelpButton), findsOneWidget);

      // Tap the help button
      await tester.tap(find.byType(HelpButton));
      await tester.pumpAndSettle();
      expect(find.byType(SkinHelp), findsOneWidget);

      // Tap outside the overlay to close it
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();
      expect(find.byType(SkinHelp), findsNothing);
    });
  });
}
