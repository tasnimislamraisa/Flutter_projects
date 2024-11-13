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
          ClipOval(
            child: Image.asset(
              AsstesPath.pic,
              width: Utils.getScreenWidth(context)  / 2,
              height: Utils.getScreenWidth(context) /2, // Make height equal to width to ensure a perfect circle
              fit: BoxFit
                  .cover, // Ensures the image covers the circle without distortion
            ),
          ),
        ],
      ),
    );
  }
}
