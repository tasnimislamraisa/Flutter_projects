import 'package:flutter/material.dart';
import 'data/draw_screen.dart';

void main() {
  runApp(DigitRecognitionApp());
}

class DigitRecognitionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Digit Recognizer",
      theme: ThemeData.dark(),  // Dark theme
      debugShowCheckedModeBanner: false,
      home: DrawScreen(),
    );
  }
}
