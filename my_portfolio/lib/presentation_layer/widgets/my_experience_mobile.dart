import '../components/my_imports.dart';

class MyExperiencesMobile extends StatelessWidget {
  const MyExperiencesMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.getScreenSize(context).height / 1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      padding: const EdgeInsets.all(20), // Reduced padding for mobile
      color: colors.scaffoldBgDarker,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                "My ",
                style: TextStyle(
                  fontSize: 30, // Reduced font size for mobile
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.whitePrimary,
                ),
              ),
              Text(
                "Experiences",
                style: TextStyle(
                  fontSize: 30, // Reduced font size for mobile
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.yellowPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15), // Reduced spacing for mobile
          SizedBox(
            width: Utils.getScreenWidth(context) * 0.9, // Adjusted for mobile
            child: const Text(
              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour",
              style: TextStyle(
                fontSize: 14, // Reduced font size for mobile
                height: 1.5,
                color: colors.whitePrimary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Column for service containers (vertical alignment for mobile)
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                // First Container
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colors.scaffoldBgDarkest,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("June-2002 - 2020"),
                      SizedBox(height: 12),
                      Text(
                        "Ux/UI Designer",
                        style: TextStyle(
                          fontSize: 18, // Adjusted for mobile
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
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colors.scaffoldBgDarkest,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("June-2002 - 2020"),
                      SizedBox(height: 12),
                      Text(
                        "Product Designer",
                        style: TextStyle(
                          fontSize: 18, // Adjusted for mobile
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
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colors.scaffoldBgDarkest,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("June-2002 - 2020"),
                      SizedBox(height: 12),
                      Text(
                        "Graphic Designer",
                        style: TextStyle(
                          fontSize: 18, // Adjusted for mobile
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
          ),
        ],
      ),
    );
  }
}
