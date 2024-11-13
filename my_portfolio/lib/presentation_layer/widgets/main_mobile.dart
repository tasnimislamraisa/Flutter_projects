import '../components/my_imports.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    // final screenWith = screenSize.width;
    // final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
      height: Utils.getScreenHeight(context),
      constraints: const BoxConstraints(minHeight: 560.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  colors.scaffoldBg.withOpacity(0.1),
                  colors.scaffoldBg, // Add additional colors if needed
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.screen,   // enables you to manipulate the opacity of widget
            child: ClipOval(
              child: Image.asset(AsstesPath.pic,
                width: Utils.getScreenWidth(context),
                //height: screenWith, // Make height equal to width to ensure a perfect circle
                fit: BoxFit.cover,  // Ensures the image covers the circle without distortion
              ),
            ),

          ),
          const SizedBox(
            height: 30,
          ),
          //intro text
          const Text(
            "Hi,\nI'm Tasnim Islam Raisa\nA Flutter Developer",
            style: TextStyle(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: colors.whitePrimary,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 190,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Get in touch"),
            ),
          ),
        ],
      ),
    );
  }
}
