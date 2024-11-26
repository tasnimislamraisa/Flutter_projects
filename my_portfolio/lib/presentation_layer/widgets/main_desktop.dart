import '../components/my_imports.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({super.key});

  @override
  _MainDesktopState createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
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

          // Right Column: Profile Picture with Hover Effect
          Center(
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  isHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isHovered = false;
                });
              },
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // SVG Image appears when hovered
                  if (isHovered)
                    SvgPicture.asset(
                      AsstesPath.v3, // Path to your SVG file
                      //color: colors.hintDark,
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.5,
                    ),
                  // Profile Picture (Circle)
                  ClipOval(
                    child: SizedBox(
                      width: screenWidth * 0.2,
                      height: screenWidth * 0.2,
                      child: Image.asset(
                        AsstesPath.dp,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
