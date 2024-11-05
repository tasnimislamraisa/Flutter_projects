import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notiva_app/Presentation_Layer/Ui/Screens/auth/register_screen.dart';
import 'package:notiva_app/Presentation_Layer/Ui/Screens/auth/reset_pass_screen.dart';
import '../../../../Data_Layer/services/auth_services.dart';
import '../../../../utils/app_color.dart';
import '../../widgets/squareTile.dart';
import '../HomeScreen.dart';

class LogInScreen extends StatefulWidget {
  final VoidCallback showLogInPage;
  const LogInScreen({super.key, required this.showLogInPage});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  bool _isLoading = false;

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (mounted) {
        // Navigate to the home screen
        Get.offAll(() => const HomeScreen());
      }

      clear(); // Clear fields after successful sign-in
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided.';
      } else {
        message = 'An error occurred. Please try again.';
      }
      Get.snackbar(
        "Login Error",
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pinkShade50,
      body:  _isLoading
          ? const Center(child: CircularProgressIndicator())
          :  SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: 160,
                  ),
                  //TODO Hello
                  Text("Hello Again!",
                      style: GoogleFonts.bebasNeue(
                              fontSize: 46,
                            //fontWeight: FontWeight.bold
        
                  )),
                  const SizedBox(height: 12,),
                  const Text("Welcome Back,you've been missed!",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                  ),),
                  const SizedBox(height: 22,),
        
                  //TODO email TextFeild
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.white,// Set your focused border color here
                          width: 1.0, // Optional: change the border width when focused
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.white,// Set your focused border color here
                          width: 1.0, // Optional: change the border width when focused
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColor.themeColor,// Set your focused border color here
                          width: 1.0, // Optional: change the border width when focused
                        ),
                      ),
                      fillColor: Colors.white,
                      focusColor: AppColor.themeColor,
                      filled: true,
                      hintText: 'Email',
                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    ),
                  ),
                  const SizedBox(height: 22,),
                  //TODO password TextFeild
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.white, // Set your focused border color here
                          width: 1.0, // Optional: change the border width when focused
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColor.themeColor, // Set your focused border color here
                          width: 1.0, // Optional: change the border width when focused
                        ),
                      ),
                      enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.white, // Set your focused border color here
                          width: 1.0, // Optional: change the border width when focused
                        ),
                      ),
                      fillColor: Colors.white,
                      focusColor: AppColor.themeColor,
                      filled: true,
                      hintText: 'Passwordd',
                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    ),
                  ),
                  const SizedBox(height: 22,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                              text: "Forgot Password",
                              style: const TextStyle(
                                color: AppColor.themeColor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() => const SetPasswordScreen());
                                },
                            ),

                        ),
                    ],
                  ),
                  const SizedBox(height: 22,),
                  //TODO SignIN Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.themeColor,
                      foregroundColor: Colors.white,
                      minimumSize: Size(MediaQuery.of(context).size.width, 50), // Button minimum size (width, height)
                      maximumSize: Size(MediaQuery.of(context).size.width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // High value for a circular shape
                      ),
        
                    ),
                      onPressed: signIn,
                      child: const Text("Sign In")
                  ),
                  const SizedBox(height: 18,),
                  const Text("Or continue with"),
                  const SizedBox(height: 26,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Squaretile(
                        onTap:()=> AuthServices().signInWithGoogle(),
                        imagePath: 'assets/images/google.png',),
                      const SizedBox(width: 26,),
                      const Squaretile(imagePath: 'assets/images/apple.jpg',),
                    ],
                  ),
                  const SizedBox(height: 26,),
                  //TODO Not A Member? register Now
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: AppColor.textColor,
                          letterSpacing: 0.4),
                      text: "Not A member?",
                      children: [
                        TextSpan(
                          text: "  Register Now",
                          style: const TextStyle(
                            color: AppColor.themeColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => RegisterScreen(showLogInPage: widget.showLogInPage));
                            },
                        ),
                      ],
                    ),
                  ),
        
        
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void clear() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
