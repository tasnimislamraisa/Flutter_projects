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
    final screenSize = MediaQuery.of(context).size;
    final screenWith = screenSize.width;
    final screenHeight = screenSize.height;
    return LayoutBuilder(
        // constrain :it  contains information about screen/window size
        builder: (context, constrains) {
      bool isDesktop =
          constrains.maxWidth >= 900; // Set a breakpoint for desktop screens
      bool isTablet = constrains.maxWidth >= 600 &&
          constrains.maxWidth < 900; // Set a breakpoint for tablets
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: colors.scaffoldBg,
        endDrawer: constrains.maxWidth >= kMinDesktopWith
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

            // Skills
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.grey,
            ),
            // Project
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.grey,
            ),
            // contact
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.blueGrey,
            ),
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
