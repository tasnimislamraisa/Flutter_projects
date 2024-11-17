import '../components/my_imports.dart';

class MyExperienceDesktop extends StatelessWidget {
  MyExperienceDesktop({super.key});

  // Data list for experiences
  final List<Map<String, String>> experiences = [
    {
      "duration": "June-2002 - 2020",
      "title": "Ux/UI Designer",
      "tool": "Figma",
      "description":
      "Creating innovative mobile apps with Flutter. Bringing ideas to life with beautiful user interfaces.",
    },
    {
      "duration": "June-2002 - 2020",
      "title": "Product Designer",
      "tool": "Adobe Photoshop",
      "description":
      "Bringing exceptional design to life, crafting seamless experiences, and shaping product identities.",
    },
    {
      "duration": "June-2002 - 2020",
      "title": "Graphic Designer",
      "tool": "Adobe Photoshop",
      "description":
      "Transforming concepts into compelling visuals, ensuring brand consistency, and designing eye-catching graphics.",
    },
  ];

  // Reusable buildContainer function
  Widget buildContainer({
    required BuildContext context,
    required String duration,
    required String title,
    required String tool,
    required String description,
  }) {
    return Container(
      width: Utils.getScreenWidth(context) * 0.2,
      height: Utils.getScreenWidth(context) * 0.2,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colors.scaffoldBgDarkest,
      ),
      child: Wrap(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                duration,
                style: TextStyle(
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.bold,
                  color: colors.yellowPrimary,
                ),
              ),
              Text(
                tool,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: colors.whitePrimary,
                ),
              ),
            Text(
                  description,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 11.0.sp,
                    color: colors.whitePrimary,
                  ),
                ),

            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.getScreenSize(context).height,
      constraints: const BoxConstraints(minHeight: 350.0),
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
            width: Utils.getScreenWidth(context) / 2,
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
          // Row displaying containers dynamically
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: experiences.map((experience) {
              return buildContainer(
                context: context,
                duration: experience["duration"]!,
                title: experience["title"]!,
                tool: experience["tool"]!,
                description: experience["description"]!,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
