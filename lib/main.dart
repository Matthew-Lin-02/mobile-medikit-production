import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color.dart';
import 'package:comp30022/pages/Pages.dart';
import 'package:comp30022/pages/PatientSignIn.dart'; // TODO - move this inside the above package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'medi_kit',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.cream),
          scaffoldBackgroundColor: AppColors.cream,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var currentPageNum = 0;
  var pages = <Widget>[];

  MyAppState() {
    _initializePages();
  }

  void _initializePages() {
    // Initialize your pages here
    pages = [
      // page 1
      PatientSignIn(),
      // page 2
      Page2(),

      // page 3
      const Page3(),

      // page 4
      PatientSignUp(),
      const MyHealthRecordPage1(),
      const MyHealthRecordPage2(),
      // Add more pages as needed
    ];
    notifyListeners();
  }

  void incrementPageNum() {
    currentPageNum++;
    notifyListeners();
  }

  void decrementPageNum() {
    currentPageNum--;
    notifyListeners();
  }

  void setPageNum(pageNumber) {
    currentPageNum = pageNumber;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    // final theme = Theme.of(context);
    
    return appState.pages[appState.currentPageNum];
   
  }
}