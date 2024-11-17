
import '../components/my_imports.dart';

class MyServiceDesktop extends StatelessWidget {
  const MyServiceDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.getScreenSize(context).height/1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      padding: const EdgeInsets.all(50), // Responsive padding
      color: colors.scaffoldBg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            children: [
              Text(
                "My ",
                style: TextStyle(
                  fontSize: 22.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: colors.whitePrimary,
                ),
              ),
              Text(
                "Service",
                style: TextStyle(
                  fontSize: 22.sp, // Larger responsive font size
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.yellowPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h), // Responsive vertical spacing
          SizedBox(
            width: 50.w, // Responsive width
            child: Text(
              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour",
              style: TextStyle(
                fontSize: 13.sp, // Responsive font size
                height: 1.5,
                color: colors.whitePrimary,
              ),
            ),
          ),
          SizedBox(height: 5.h), // Responsive vertical spacing
          // Row with three service containers
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly space the items
            children: [
              // First Container
              _buildServiceContainer(
                context,
                icon: Icons.code,
                title: "App Development",
                description:
                "Creating innovative mobile apps with Flutter. Bringing ideas to life with beautiful user interfaces.",
              ),
              // Second Container
              _buildServiceContainer(
                context,
                icon: Icons.security,
                title: "Cyber Security",
                description:
                "Ensuring the security of systems and networks. Protecting data from threats and attacks.",
              ),
              // Third Container
              _buildServiceContainer(
                context,
                icon: Icons.cloud,
                title: "Cloud Computing",
                description:
                "Leveraging cloud infrastructure for scalable solutions. Empowering businesses with cloud technology.",
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build a service container
  Widget _buildServiceContainer(
      BuildContext context, {
        required IconData icon,
        required String title,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 22.sp, // Responsive icon size
                color: colors.yellowPrimary,
              ),
              SizedBox(height: 1.h), // Responsive spacing
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: colors.whitePrimary,
                ),
              ),
              SizedBox(height: 1.h), // Responsive spacing
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.sp, // Responsive font size
                  color: colors.whitePrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
