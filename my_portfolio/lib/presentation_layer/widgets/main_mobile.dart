import '../components/my_imports.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: Utils.getScreenHeight(context) /1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Image with ShaderMask
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  colors.scaffoldBg.withOpacity(0.1),
                  colors.scaffoldBg,
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.screen, // Adjust opacity
            child: ClipOval(
              child: Image.asset(
                AsstesPath.pic,
                width: Utils.getScreenWidth(context) * 0.5, // 50% of screen width
                height: Utils.getScreenWidth(context) * 0.5, // Equal to width for perfect circle
                fit: BoxFit.cover, // Ensures proper fit
              ),
            ),
          ),
          const SizedBox(height: 35),
          // Animated Greeting Text with Typewriter effect
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 22, // Slightly smaller font for mobile
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Hi, I'm ",
                  textStyle: const TextStyle(color: Colors.white),
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  "Tasnim Islam Raisa\n",
                  textStyle: const TextStyle(color: Colors.yellow),
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  "A Flutter Developer",
                  textStyle: const TextStyle(color: Colors.white),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              repeatForever: true, // Repeat the animation indefinitely
            ),
          ),
          const SizedBox(height: 20),
          // "Get in touch" Button
          SizedBox(
            width: 180, // Adjusted button width for mobile
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.yellowPrimary, // Button background color
                foregroundColor: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4), // Slightly rounded corners
                ),
              ),
              child: const Text("Get in touch"),
            ),
          ),
        ],
      ),
    );
  }
}
