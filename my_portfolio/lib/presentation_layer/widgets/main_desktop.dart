import 'dart:math';
import 'package:flutter/material.dart';
import '../components/my_imports.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({super.key});

  @override
  _MainDesktopState createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _controller;
  late List<String> codingLanguages;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
      setState(() {});
    });

    codingLanguages = ["Flutter", "Dart", "Python", "JavaScript", "HTML", "CSS", "Firebase"];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              // Animated Greeting Text
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
                      textStyle: const TextStyle(color: colors.yellowPrimary,),
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      "A Flutter Developer",
                      textStyle: const TextStyle(color: Colors.white),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  repeatForever: true,
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
                    backgroundColor: colors.yellowPrimary,  // Button background color
                    foregroundColor: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text("Get in touch"),
                ),
              ),
            ],
          ),

          // Right Column: Profile Picture with Animation
          Center(
            child: MouseRegion(
              onEnter: (_) {
                setState(() => isHovered = true);
                _controller.repeat(reverse: false);
              },
              onExit: (_) {
                setState(() => isHovered = false);
                _controller.stop();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Profile Picture
                  ClipOval(
                    child: SizedBox(
                      width: screenWidth * 0.3,
                      height: screenWidth * 0.3,
                      child:  Image.asset(
                        AsstesPath.pic,
                        fit: BoxFit.cover, // Ensures the image fills the circle
                      ),
                    ),
                  ),

                  // Animated coding language names
                  if (isHovered)
                    ...List.generate(codingLanguages.length, (index) {
                      final randomAngle = Random().nextDouble() * 2 * pi; // Random angle in radians
                      final distance = (screenWidth * 0.15) + (5 * Random().nextDouble()); // Reduced distance for slower movement

                      return Positioned(
                        left: screenWidth * 0.15 + distance * cos(randomAngle),
                        top: screenWidth * 0.15 + distance * sin(randomAngle),
                        child: Transform.scale(
                          scale: (1.0 + 0.3 * sin(_controller.value * 2 * pi)), // Adjusted scale for smoother animation
                          child: Text(
                            codingLanguages[index],
                            style: TextStyle(
                              fontSize: 16 + Random().nextInt(8).toDouble(), // Adjusted font size range
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
