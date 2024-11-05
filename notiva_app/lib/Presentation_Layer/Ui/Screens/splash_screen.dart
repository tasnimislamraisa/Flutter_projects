import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_color.dart';
import '../widgets/app_logo_widget.dart';
import 'auth/main_page.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double _opacity = 0.0; // Initial opacity for fade-in animation

  Future<void> _moveToNextScreen() async{
    await Future.delayed(const Duration(seconds: 3));
    //Get.off(()=>const HomeScreen());
    Get.off(()=>const MainPage());
  }
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
    // Start the animation after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0; // Change opacity to 1 (fully visible)
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Animated Text for App Name "Notiva"
              AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 2), // Duration of fade-in
                child: const Text(
                  "Notiva",
                  style: TextStyle(
                    fontSize: 32, // Font size of the app name
                    fontWeight: FontWeight.bold, // Bold text for emphasis
                    color: AppColor.themeColor, // Customize the color of the text
                  ),
                ),
              ),
              const AppLogoWidget(),
              const Spacer(),
              const CircularProgressIndicator(backgroundColor: AppColor.themeColor,color: Colors.white,),
              const SizedBox(height: 16,),
              const Text("version 1.0.8"),

            ],
          ),
        ),
      ),
    );
  }
}
