import 'dart:ui';

import 'package:expense_tracker_app_1/screens/stats/charts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Transictions',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 30,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                //color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(12,20,12,12),
                  child: MyChart(),
                ),
              ),
            ],
          ),
    ));
  }
}
