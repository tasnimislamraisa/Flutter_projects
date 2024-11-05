import 'package:flutter/material.dart';
import 'package:notiva_app/Presentation_Layer/Ui/Screens/auth/register_screen.dart';

import 'log_in_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showLogInPage=true;
  void toggleScreens(){
    setState(() {
      showLogInPage=!showLogInPage;
    });

  }
  @override
  Widget build(BuildContext context) {
    if(showLogInPage){
      return LogInScreen(showLogInPage: toggleScreens,);
    } else {
      return RegisterScreen(showLogInPage: toggleScreens,);
    }
  }
}
