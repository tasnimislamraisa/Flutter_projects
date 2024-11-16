import '../components/my_imports.dart';

class MyServiceDesktop extends StatelessWidget {
  const MyServiceDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.getScreenSize(context).height / 1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      padding: const EdgeInsets.all(80),
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
                "Service",
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
            width: Utils.getScreenWidth(context) / 2, // Adjusted for desktop screens
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly space the items
            children: [
              // First Container
              Container(
                width: Utils.getScreenWidth(context) * 0.2, // Larger size for desktop
                height: Utils.getScreenWidth(context) * 0.2, // Proportional height
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colors.scaffoldBgDarkest,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.code,
                      size: 50,
                      color: colors.yellowPrimary,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "App Development",
                      style: TextStyle(
                        fontSize: 24,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: colors.whitePrimary,
                      ),
                    ),
                    const Text(
                      "Creating innovative mobile apps with Flutter. Bringing ideas to life with beautiful user interfaces.",
                      textAlign: TextAlign.center,
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
                width: Utils.getScreenWidth(context) * 0.2,
                height: Utils.getScreenWidth(context) * 0.2,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colors.scaffoldBgDarkest,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.security,
                      size: 50,
                      color: colors.yellowPrimary,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Cyber Security",
                      style: TextStyle(
                        fontSize: 24,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: colors.whitePrimary,
                      ),
                    ),
                    const Text(
                      "Ensuring the security of systems and networks. Protecting data from threats and attacks.",
                      textAlign: TextAlign.center,
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
                width: Utils.getScreenWidth(context) * 0.2,
                height: Utils.getScreenWidth(context) * 0.2,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colors.scaffoldBgDarkest,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.cloud,
                      size: 50,
                      color: colors.yellowPrimary,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Cloud Computing",
                      style: TextStyle(
                        fontSize: 24,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: colors.whitePrimary,
                      ),
                    ),
                    const Text(
                      "Leveraging cloud infrastructure for scalable solutions. Empowering businesses with cloud technology.",
                      textAlign: TextAlign.center,
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
