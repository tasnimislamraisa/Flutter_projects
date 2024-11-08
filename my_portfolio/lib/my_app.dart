import 'package:flutter/material.dart';
import 'package:my_portfolio/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Portfolio",
      debugShowCheckedModeBanner: true,
      home: HomeScreen(),
    );
  }
}
