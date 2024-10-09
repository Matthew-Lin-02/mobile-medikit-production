import 'package:flutter/material.dart';

class AppColors {
  // Main color scheme + background
  static const Color cream = Color(0xFFF7F0E5); // background
  static const Color darkCream = Color.fromARGB(255, 247, 224, 204);
  static const Color yellowCream = Color(0xFFF1E2C0);
  static const Color grey = Color.fromARGB(255, 143, 143, 143);
  static const Color black = Color(0xFF000000);

  // Action Button Colour
  static const Color red = Color(0xFFC0573B);

  // Step Indicator
  static const Color blue = Color.fromRGBO(59, 131, 159, 1.0);
  static const Color mediumBlue = Color.fromRGBO(35, 81, 104, 1);
  static const Color darkBlue = Color.fromRGBO(0, 68, 95, 1);
  static const Color darkGrey = Color.fromARGB(255, 88, 88, 88);

  // Back Arrow
  static const Color turquoise = Color(0xFF50C7BE);

  //Status Tray
  static const Color machineTranslationOverlayRed = Color(0xFFB74534);
  static const Color machineTranslationOverlayLeftCream = Color(0xFFFFF5DF);
  static const Color machineTranslationOverlayRightCream = yellowCream;
  static const Color machineTranslationOverlayBlueButton = Color(0xFF00B1B2);
  static const Color contactHealthExpertOverlayCream = Color(0xFFFFF5DF);
  static const Color wifiInfoOverlayBlue = Color.fromARGB(255, 0, 177, 178);
  static const Color wifiInfoTextGreen = Color.fromARGB(255, 0, 216, 89);

  //Screening Tools
  static const Color incomplete = Color(0xFFFC7474);
  static const Color complete = Color(0xFF74FC82);
  static const Color lightGrey = Color(0xFFE5E5E5);
  static const Color diagnosticGreen = Color(0xFF08B67F);

  // Results
  static const Color genai = Color(0xFF08B67F);
  static Color resultsOrange = const Color(0xFFFF5F15).withOpacity(0.8);
  static Color resultsGreen = const Color(0xFF169D15).withOpacity(0.75);
  static Color resultsBlue = const Color(0xFF48a4fc);
  static const Color resultsDarkGreen = Color(0xFF006847);
  static const Color fadedGrey = Color.fromARGB(255, 170, 175, 180);
  static const Color fieldCream = Color.fromARGB(255, 255, 242, 214);
  static const Color fieldDarkCream = Color.fromARGB(255, 241, 226, 192);
}
