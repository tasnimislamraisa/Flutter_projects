import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_color.dart';
import 'log_in_screen.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}


class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController _emailController=TextEditingController();

  Future<void>  passwordReset() async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      Get.snackbar(
        'Successful',
        'Please Check Your Email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.themeColor,
        colorText: Colors.white,
      );
      Get.to(LogInScreen(showLogInPage: () {},));
    } on FirebaseAuthException catch(e){
      Get.snackbar(
        'Error',
        e.message ?? 'An error occurred. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
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
                  Text("Reset Your Password!",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 35,
                        //fontWeight: FontWeight.bold

                      )),
                  const SizedBox(height: 12,),
                  const Text("We'll send you a reset password link!",style: TextStyle(
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
                      onPressed: passwordReset,
                      child: const Text("Reset Password")
                  ),





                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
