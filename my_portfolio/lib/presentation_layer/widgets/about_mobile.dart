import '../components/my_imports.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.getScreenSize(context).height / 1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          // Profile Picture
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: -15, // Adjust this value to move the border left
                bottom: -15,
                child: Container(
                  width: Utils.getScreenWidth(context) * 0.5, // Border size
                  height: Utils.getScreenWidth(context) * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: colors.yellowPrimary, // Border color
                      width: 5, // Thin border width
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width:
                      Utils.getScreenWidth(context) * 0.5, // 50% of screen width
                  height: Utils.getScreenWidth(context) *
                      0.5, // Same as width for a perfect circle
                  child: Image.asset(
                    AsstesPath.pic,
                    fit: BoxFit
                        .cover, // Ensures the image fills the circle without distortion
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20), // Spacing between picture and text
          // About Me Section
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "About ",
                style: TextStyle(
                  fontSize: 24, // Reduced font size for mobile
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.whitePrimary,
                ),
              ),
              Text(
                "Me",
                style: TextStyle(
                  fontSize: 24, // Reduced font size for mobile
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.yellowPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // About Me Text
          SizedBox(
            width: Utils.getScreenWidth(context) *
                0.8, // Adjust width for smaller screens
            child: const Text(
              "A passionate 3rd-year Computer Science and Engineering student with a love for coding and creating innovative solutions. Currently, I'm diving deep into Flutter development to build beautiful and functional mobile applications.",
              textAlign:
                  TextAlign.center, // Center-align text for better readability
              style: TextStyle(
                fontSize: 16, // Reduced font size for mobile
                height: 1.5,
                color: colors.whitePrimary,
              ),
            ),
          ),
          const SizedBox(height: 15),
          // Contact Us Button
          SizedBox(
            width: 200, // Adjust button size for mobile
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    colors.yellowPrimary, // Button background color
                foregroundColor: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4), // Rounded corners
                ),
              ),
              child: const Text("Contact Us"),
            ),
          ),
        ],
      ),
    );
  }
}
