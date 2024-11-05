import 'dart:async';

import 'package:flutter/material.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> _initializeFirebase() async {
  // Only initialize Firebase if it hasn't been initialized yet
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty){
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runZonedGuarded(() {
    runApp(const MyApp());
  }, (error, stackTrace) {
    // Handle errors here if necessary
  });

}
