import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColor.primaryColor,
  hintColor: AppColor.accentColor,
  scaffoldBackgroundColor: AppColor.backgroundColor,
  appBarTheme: const AppBarTheme(
    color: AppColor.primaryColor, // Pink app bar
    iconTheme: IconThemeData(color: AppColor.lightTextColor), // White icons
    titleTextStyle: TextStyle(
      color: AppColor.lightTextColor, // White text in AppBar
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColor.accentColor, // Bright pink buttons
    textTheme: ButtonTextTheme.primary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.accentColor, // Bright pink FAB
    foregroundColor: AppColor.lightTextColor, // White text/icons on FAB
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: AppColor.textColor, fontSize: 24), // Black text for large headers
    bodyLarge: TextStyle(color: AppColor.textColor), // Black body text
    labelLarge: TextStyle(color: AppColor.lightTextColor), // White text on buttons
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(borderSide: BorderSide(color: AppColor.borderColor)),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.borderColor)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.primaryColor)),
  ),
  dividerColor: AppColor.borderColor, // Light grey dividers
);