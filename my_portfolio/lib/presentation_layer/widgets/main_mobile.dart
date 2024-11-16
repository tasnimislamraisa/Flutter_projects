import '../components/my_imports.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: Utils.getScreenHeight(context)*0.8,
      constraints: const BoxConstraints(minHeight: 350.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Image
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
                width: Utils.getScreenWidth(context) * 0.5, // 60% of screen width
                height: Utils.getScreenWidth(context) * 0.5, // Equal to width for perfect circle
                fit: BoxFit.cover, // Ensures proper fit
              ),
            ),
          ),
          const SizedBox(height: 35),
          // Introduction Text
          const Text(
            "Hi,\nI'm Tasnim Islam Raisa\nA Flutter Developer",
            textAlign: TextAlign.center, // Center-align text
            style: TextStyle(
              fontSize: 22, // Slightly smaller for mobile
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: colors.whitePrimary,
            ),
          ),
          const SizedBox(height: 20),
          // Button
          SizedBox(
            width: 180, // Adjusted for mobile
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.yellowPrimary, // Button background
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
