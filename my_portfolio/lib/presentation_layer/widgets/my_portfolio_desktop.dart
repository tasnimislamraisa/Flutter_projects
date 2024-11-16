import '../components/my_imports.dart';

class MyPortfolioDesktop extends StatelessWidget {
  const MyPortfolioDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.getScreenSize(context).height ,
      constraints: const BoxConstraints(minHeight: 350.0),
      padding: EdgeInsets.all(80),
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
                  fontSize: 50,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.whitePrimary,
                ),
              ),
              Text(
                "Portfolio",
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
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Determine image size based on screen width
              SizedBox(
                width: Utils.getScreenWidth(context) * 0.15,
                //height: Utils.getScreenWidth(context) * 0.15,
                child: Image.asset(
                  AsstesPath.flutter,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20), // Add spacing between images
              Column(
                children: [
                  SizedBox(
                    width: Utils.getScreenWidth(context) * 0.15,
                    height: Utils.getScreenWidth(context) * 0.15,
                    child: Image.asset(
                      AsstesPath.java,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                      height: 20), // Add spacing between images
                  SizedBox(
                    width: Utils.getScreenWidth(context) * 0.15,
                    height: Utils.getScreenWidth(context) * 0.15,
                    child: Image.asset(
                      AsstesPath.web,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
