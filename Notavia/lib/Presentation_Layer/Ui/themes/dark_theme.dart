import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColor.pinkShade700, // Darker shade of pink
  hintColor: AppColor.pinkShade400, // Dark background
  scaffoldBackgroundColor: Colors.black, // Dark scaffold background
  appBarTheme: const AppBarTheme(
    color: AppColor.pinkShade700, // Dark pink app bar
    iconTheme: IconThemeData(color: AppColor.lightTextColor), // White icons
    titleTextStyle: TextStyle(
      color: AppColor.lightTextColor, // White text in AppBar
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColor.pinkShade400, // Dark pink buttons
    textTheme: ButtonTextTheme.primary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.pinkShade400, // Dark pink FAB
    foregroundColor: AppColor.lightTextColor, // White text/icons on FAB
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: AppColor.lightTextColor, fontSize: 24), // White text for large headers
    bodyLarge: TextStyle(color: AppColor.lightTextColor), // White body text
    labelLarge: TextStyle(color: AppColor.lightTextColor), // White text on buttons
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(borderSide: BorderSide(color: AppColor.borderColor)),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.borderColor)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.pinkShade700)),
  ),
  dividerColor: Colors.grey.shade800, // Dark grey dividers
);