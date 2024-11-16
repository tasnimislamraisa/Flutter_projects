import '../components/my_imports.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.getScreenSize(context).height / 1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
              clipBehavior: Clip.none,
            children: [
              Positioned(
                left: -15,
                bottom: -15,
                child: Container(
                width: Utils.getScreenWidth(context) * 0.29, // Adjust size as needed
                height: Utils.getScreenWidth(context) * 0.29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: colors.yellowPrimary, // Border color
                      width: 5, // Thin border width
                    ),
                  ),
              ),),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                width: Utils.getScreenWidth(context) *
                    0.29, // Adjust size as needed
                height: Utils.getScreenWidth(context) *
                    0.29, // Same as width for a perfect circle
                child: Image.asset(
                  AsstesPath.pic,
                  fit: BoxFit
                      .cover, // Ensures the image fills the circle without distortion
                ),
                            ),
              ),]
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    "About ",
                    style: TextStyle(
                      fontSize: 50,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: colors.whitePrimary,
                    ),
                  ),
                  Text(
                    "Me",
                    style: TextStyle(
                      fontSize: 50,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: colors.yellowPrimary,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                width: Utils.getScreenWidth(context) / 4,
                child: const Text(
                  "A passionate 3rd-year Computer Science and Engineering student with a love for coding and creating innovative solutions. Currently, I'm diving deep into Flutter development to build beautiful and functional mobile applications.",
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    // fontWeight: FontWeight.w400,
                    color: colors.whitePrimary,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors
                        .yellowPrimary, // Button background color
                    foregroundColor: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          4), // Rounded corners
                    ),
                  ),
                  child: const Text("Contact Us"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
