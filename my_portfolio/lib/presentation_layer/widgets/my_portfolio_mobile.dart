import '../components/my_imports.dart';

class MyPortfolioMobile extends StatelessWidget {
  const MyPortfolioMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.getScreenSize(context).height / 1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      padding: const EdgeInsets.all(20), // Reduced padding for mobile
      color: colors.scaffoldBgDarkest,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                "Portfolio",
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
              textAlign: TextAlign.center, // Center text for mobile
              style: TextStyle(
                fontSize: 14, // Reduced font size for mobile
                height: 1.5,
                color: colors.whitePrimary,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Adjust image size for mobile
              SizedBox(
                width: Utils.getScreenWidth(context) * 0.3,
                height: Utils.getScreenWidth(context) * 0.3,
                child: Image.asset(
                  AsstesPath.flutter,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15), // Adjust spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Utils.getScreenWidth(context) * 0.3,
                    height: Utils.getScreenWidth(context) * 0.3,
                    child: Image.asset(
                      AsstesPath.java,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15), // Adjust spacing between images
                  SizedBox(
                    width: Utils.getScreenWidth(context) * 0.3,
                    height: Utils.getScreenWidth(context) * 0.3,
                    child: Image.asset(
                      AsstesPath.web,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
