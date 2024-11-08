import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        scrollDirection: Axis.vertical,
        children: [
          // Main
          Container(
            height: 500,
            width:double.maxFinite,
            color: Colors.blueGrey,
          ),
          // Skills
          Container(
            height: 500,
            width:double.maxFinite,
            color: Colors.deepPurpleAccent,
          ),
          // Project
          Container(
            height: 500,
            width:double.maxFinite,
            color: Colors.grey,
          ),
          // contact
          Container(
            height: 500,
            width:double.maxFinite,
            color: Colors.blueGrey,
            
          ),
          // footer
          Container(
            height: 500,
            width:double.maxFinite,
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
