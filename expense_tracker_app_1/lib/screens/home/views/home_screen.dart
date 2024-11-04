import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../stats/stats.dart';
import 'main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// raisa

class _HomeScreenState extends State<HomeScreen> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Expense Tracker"),
      // ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
          onTap: (value){
          if(mounted){
            setState(() {
              index=value;
            });
          }
          print(value);
        },
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.pink,  // Color for selected item
        unselectedItemColor: Colors.grey,  // Color for unselected items
        elevation: 3,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.circle_grid_3x3_fill), label: 'states')
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.tertiary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary,
                ], transform: const GradientRotation(pi / 4))),
            child: const Icon(CupertinoIcons.add)),
      ),
      body: index==0 ? const MainScreen() : const StatsScreen(),
    );
  }
}
