import '../components/my_imports.dart';

class MyExperienceDesktop extends StatelessWidget {
  const MyExperienceDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.getScreenSize(context).height/1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      //margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      padding: const EdgeInsets.all(100),
      color: colors.scaffoldBg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                "My ",
                style: TextStyle(
                  fontSize: 50,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.whitePrimary,
                ),
              ),
              Text(
                "Experiences",
                style: TextStyle(
                  fontSize: 50,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.yellowPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: Utils.getScreenWidth(context) /
                2, // Adjusted for desktop screens
            child: const Text(
              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour",
              style: TextStyle(
                fontSize: 18,
                height: 1.5,
                color: colors.whitePrimary,
              ),
            ),
          ),
          const SizedBox(height: 50),
          // Row with three service containers
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Evenly space the items
            children: [
              // First Container
              Container(
                width: Utils.getScreenWidth(context) *
                    0.2, // Larger size for desktop
                height: Utils.getScreenWidth(context) *
                    0.2, // Proportional height
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colors.scaffoldBgDarkest,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("June-2002 - 2020"),
                    SizedBox(height: 12),
                    Text(
                      "Ux/UI Designer",
                      style: TextStyle(
                        fontSize: 22,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: colors.yellowPrimary,
                      ),
                    ),
                    Text(
                      "Figma\n",
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: colors.whitePrimary,
                      ),
                    ),
                    Text(
                      "Creating innovative mobile apps with Flutter. Bringing ideas to life with beautiful user interfaces.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: colors.whitePrimary,
                      ),
                    ),
                  ],
                ),
              ),
              // Second Container
              Container(
                width: Utils.getScreenWidth(context) *
                    0.2,
                height: Utils.getScreenWidth(context) *
                    0.2,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colors.scaffoldBgDarkest,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("June-2002 - 2020"),
                    SizedBox(height: 12),
                    Text(
                      "Product Designer",
                      style: TextStyle(
                        fontSize: 22,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: colors.yellowPrimary,
                      ),
                    ),
                    Text(
                      "Adobe Photoshop\n",
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: colors.whitePrimary,
                      ),
                    ),
                    Text(
                      "Creating innovative mobile apps with Flutter. Bringing ideas to life with beautiful user interfaces.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: colors.whitePrimary,
                      ),
                    ),
                  ],
                ),
              ),
              // Third Container
              Container(
                width: Utils.getScreenWidth(context) *
                    0.2,
                height: Utils.getScreenWidth(context) *
                    0.2,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colors.scaffoldBgDarkest,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("June-2002 - 2020"),
                    SizedBox(height: 12),
                    Text(
                      "Graphic Designer",
                      style: TextStyle(
                        fontSize: 22,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: colors.yellowPrimary,
                      ),
                    ),
                    Text(
                      "Adobe Photoshop\n",
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: colors.whitePrimary,
                      ),
                    ),
                    Text(
                      "Creating innovative mobile apps with Flutter. Bringing ideas to life with beautiful user interfaces.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: colors.whitePrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
