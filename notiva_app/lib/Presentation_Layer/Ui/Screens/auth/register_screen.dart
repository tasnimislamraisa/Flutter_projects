import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Data_Layer/services/auth_services.dart';
import '../../../../utils/app_color.dart';
import '../../widgets/squareTile.dart';
import 'auth_screen.dart';
import 'log_in_screen.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback showLogInPage;
  const RegisterScreen({super.key, required this.showLogInPage});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _confirmPasswordController=TextEditingController();
  final TextEditingController _nameController=TextEditingController();



  Future<void> signUp() async {
    if (_passwordController.text.trim() != _confirmPasswordController.text.trim()) {
      // Show error if passwords don't match
      Get.snackbar('Error', 'Passwords do not match',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Save the name to Firestore
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
      });

      // Navigate to home or show success
      Get.snackbar('Success', 'Account created successfully!',
          snackPosition: SnackPosition.BOTTOM);
      clear();
      Get.offAll(() => LogInScreen(showLogInPage: widget.showLogInPage));
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'Sign-up failed',
          snackPosition: SnackPosition.BOTTOM);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pinkShade50,
      body: SingleChildScrollView(
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
                  Text("Hello THERE!",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 46,
                        //fontWeight: FontWeight.bold

                      )),
                  const SizedBox(height: 12,),
                  const Text("Register below with your details!",style: TextStyle(
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
                  //ToDo User name
                  TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
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
                      hintText: 'Name',
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
                      hintText: 'Password',
                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    ),
                  ),
                  const SizedBox(height: 22,),
                  //TODO password TextFeild
                  TextField(
                    controller: _confirmPasswordController,
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
                      hintText: 'Confirm Password',
                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    ),
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
                      onPressed: signUp,
                      child: const Text("Sign Up")
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
                      text: "I'm a member!",
                      children: [
                        TextSpan(
                          text: "  Login Now",
                          style: const TextStyle(
                            color: AppColor.themeColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                            Get.offAll(()=>const AuthScreen());
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
    // TODO: implement dispose
    super.dispose();
    _emailController.clear();
    _passwordController.clear();
    _nameController.clear();
    _confirmPasswordController.clear();
  }

  @override
  void dispose() {
    if (mounted) {
      _emailController.dispose();
      _passwordController.dispose();
      _confirmPasswordController.dispose();
      _nameController.dispose();
    }
    super.dispose();
  }


}
