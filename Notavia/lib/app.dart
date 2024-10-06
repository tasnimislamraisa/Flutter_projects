import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Presentation_Layer/Ui/Screens/HomeScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'NotiVa',
      debugShowCheckedModeBanner: true,
      home: HomeScreen(),
    );
  }
}
