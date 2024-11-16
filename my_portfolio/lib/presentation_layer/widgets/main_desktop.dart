import '../components/my_imports.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    // final screenWith = screenSize.width;
    return Container(
      height: Utils.getScreenSize(context).height / 1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hi,\nI'm Tasnim Islam Raisa\nA Flutter Developer",
                style: TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.whitePrimary,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Get in touch"),
                ),
              ),
            ],
          ),
          Center(
            child: ClipOval(
              child: SizedBox(
                width: Utils.getScreenWidth(context) * 0.3, // Adjust size as needed
                height: Utils.getScreenWidth(context) * 0.3, // Same as width for a perfect circle
                child: Image.asset(
                  AsstesPath.pic,
                  fit: BoxFit.cover, // Ensures the image fills the circle without distortion
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
