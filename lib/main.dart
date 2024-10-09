import 'package:flutter/material.dart';
import 'color.dart';
import 'package:comp30022/pages/Pages.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
        title: 'medi_kit',
        theme: ThemeData(
          fontFamily: 'VarelaRound',
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.cream),
          scaffoldBackgroundColor: AppColors.cream,
        ),
        home: const SignIn(),
        routes: {
          '/patientProfile': (context) => const PatientProfile(),
          '/NurseEdPage': (context) => const NurseEdPage()
        });
  }
}
