import '../components/my_imports.dart';

class MyServiceMobile extends StatelessWidget {
  const MyServiceMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.whitePrimary,
                ),
              ),
              Text(
                "Service",
                style: TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.yellowPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour",
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: colors.whitePrimary,
            ),
          ),
          const SizedBox(height: 30),
          // Column with service containers
          Column(
            children: [
              // First Service Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colors.scaffoldBgDarkest,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.code,
                      size: 40,
                      color: colors.yellowPrimary,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "App Development",
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: colors.whitePrimary,
                      ),
                    ),
                    Text(
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
              // Second Service Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colors.scaffoldBgDarkest,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.security,
                      size: 40,
                      color: colors.yellowPrimary,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Cyber Security",
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: colors.whitePrimary,
                      ),
                    ),
                    Text(
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
              // Third Service Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colors.scaffoldBgDarkest,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud,
                      size: 40,
                      color: colors.yellowPrimary,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Cloud Computing",
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: colors.whitePrimary,
                      ),
                    ),
                    Text(
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
