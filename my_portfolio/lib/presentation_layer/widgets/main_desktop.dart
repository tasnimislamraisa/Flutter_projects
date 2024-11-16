import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/my_imports.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = Utils.getScreenSize(context).height;
    final screenWidth = Utils.getScreenWidth(context);

    return Container(
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      //margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Left Column: Animated Text and Button
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Animated Greeting Text with multiple colors
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30,
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
                  repeatForever: true, // Repeats the animation
                ),
              ),
              const SizedBox(height: 15),
              // "Get in touch" Button
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    // Define your action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.yellowPrimary, // Button background color
                    foregroundColor: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4), // Rounded corners
                    ),
                  ),
                  child: const Text("Get in touch"),
                ),
              ),
            ],
          ),

          // Right Column: Profile Picture
          Center(
            child: ClipOval(
              child: SizedBox(
                width: screenWidth * 0.3, // Adjust width
                height: screenWidth * 0.3, // Same as width for a perfect circle
                child: Image.asset(
                  AsstesPath.pic,
                  fit: BoxFit.cover, // Ensures the image fills the circle
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
