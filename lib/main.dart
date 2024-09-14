import 'package:comp30022/pages/screening/Observations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color.dart';
import 'package:comp30022/pages/Pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GuidedConsultationState()),
        // add other providers
      ],
      child: MaterialApp(
          title: 'medi_kit',
          theme: ThemeData(
            fontFamily: 'VarelaRound',
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.cream),
            scaffoldBackgroundColor: AppColors.cream,
          ),
          home: const SignIn(),
          routes: {'/patientProfile': (context) => const PatientProfile()}),
    );
  }
}
