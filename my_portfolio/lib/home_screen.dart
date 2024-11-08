import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation_layer/components/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldBg,
      body:ListView(
        scrollDirection: Axis.vertical,
        children: [
          // Main
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(vertical:10 ,horizontal: 20),
            width:double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.transparent,colors.bgLight1]),
              borderRadius: BorderRadius.circular(100)
            ),

            child: Row(
              children: [
                Text("TIR"),
                Spacer(),
                for(int i=0;i<5;i++)
                   Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: TextButton(onPressed: (){}, child: Text("Button")),
                   )
              ],
            ),
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
