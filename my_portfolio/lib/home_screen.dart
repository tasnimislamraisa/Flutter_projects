import 'package:my_portfolio/presentation_layer/widgets/contact_desktop.dart';
import 'package:my_portfolio/presentation_layer/widgets/contact_mobile.dart';
import 'package:my_portfolio/presentation_layer/widgets/my_experience_desktop.dart';
import 'package:my_portfolio/presentation_layer/widgets/my_experience_mobile.dart';

import 'presentation_layer/components/my_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        // constrain :it  contains information about screen/window size
        builder: (context, constrains) {
      bool isDesktop = constrains.maxWidth >= 900; // Set a breakpoint for desktop screens
      bool isMobile = constrains.maxWidth >= 600;
      //bool isTablet = constrains.maxWidth >= 600 && constrains.maxWidth < 900; // Set a breakpoint for tablets
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: colors.scaffoldBg,
        endDrawer: constrains.maxWidth >= 900
            ? null
            : const DrawerMobile(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // Main
            if (isDesktop)
              const HeaderDesktop()
            else
              HeaderMobile(
                onLogoTap: () {},
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),

            //const MainDesktop(),
            isDesktop ? const MainDesktop() : const MainMobile(),
            //if (isDesktop) const MainDesktop() else if(isTablet) const MainMobile(),

            // My Experience

            isDesktop
                ? MyExperienceDesktop()
                : const MyExperiencesMobile(),

            // about me
            isDesktop ? const AboutDesktop() : const AboutMobile(),

            // My Service
            isDesktop ? const MyServiceDesktop() : const MyServiceMobile(),

            // my portfolio : Desktop
            isDesktop ? const MyPortfolioDesktop() : const MyPortfolioMobile(),

            // contact
            isDesktop ? const ContactDesktop() : const ContactMobile(),


            // footer
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.greenAccent,
            ),
          ],
        ),
      );
    });
  }
}
