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
            else if (isTablet)
              HeaderMobile(
                onLogoTap: () {},
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              )
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

            // Skills



            // about me

            isDesktop ? Container(
          height: Utils.getScreenSize(context).height / 1.2,
          constraints: const BoxConstraints(minHeight: 350.0),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.black,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          SizedBox(
          width: Utils.getScreenWidth(context) * 0.3, // Adjust size as needed
          height: Utils.getScreenWidth(context) * 0.3, // Same as width for a perfect circle
          child: Image.asset(
          AsstesPath.pic,
          fit: BoxFit.cover, // Ensures the image fills the circle without distortion
          ),
          ),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Row(
          children: [
          Text("About ",style: TextStyle(
          fontSize: 30,
          height: 1.5,
          fontWeight: FontWeight.bold,
          color: colors.whitePrimary,
          ),),
          Text("Me",style: TextStyle(
          fontSize: 30,
          height: 1.5,
          fontWeight: FontWeight.bold,
          color: colors.yellowPrimary,
          ),)
          ],
          ),
          const SizedBox(height: 14,),
          SizedBox(
          width: Utils.getScreenWidth(context)/4,
          child: const Text(
          "A passionate 3rd-year Computer Science and Engineering student with a love for coding and creating innovative solutions. Currently, I'm diving deep into Flutter development to build beautiful and functional mobile applications.",
          style: TextStyle(
          fontSize: 18,
          height: 1.5,
          // fontWeight: FontWeight.w400,
          color: colors.whitePrimary,
          ),
          ),
          ),
          const SizedBox(
          height: 15,
          ),
          SizedBox(
          width: 150,
          child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
          backgroundColor: colors.yellowPrimary, // Button background color
          foregroundColor: Colors.white, // Text color
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4), // Rounded corners
          ),
          ),
          child: const Text("Contact Us"),
          ),
          ),
          ],
          ),


          ],
          ),
          ) : Container(
          height: Utils.getScreenSize(context).height / 1.2,
          constraints: const BoxConstraints(minHeight: 350.0),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.black,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const SizedBox(height: 50,),
          // Profile Picture
          SizedBox(
          width: Utils.getScreenWidth(context) * 0.5, // 50% of screen width
          height: Utils.getScreenWidth(context) * 0.5, // Same as width for a perfect circle
          child: ClipOval(
          child: Image.asset(
          AsstesPath.pic,
          fit: BoxFit.cover, // Ensures the image fills the circle without distortion
          ),
          ),
          ),
          const SizedBox(height: 20), // Spacing between picture and text
          // About Me Section
          const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
          "About ",
          style: TextStyle(
          fontSize: 24, // Reduced font size for mobile
          height: 1.5,
          fontWeight: FontWeight.bold,
          color: colors.whitePrimary,
          ),
          ),
          Text(
          "Me",
          style: TextStyle(
          fontSize: 24, // Reduced font size for mobile
          height: 1.5,
          fontWeight: FontWeight.bold,
          color: colors.yellowPrimary,
          ),
          ),
          ],
          ),
          const SizedBox(height: 14),
          // About Me Text
          SizedBox(
          width: Utils.getScreenWidth(context) * 0.8, // Adjust width for smaller screens
          child: const Text(
          "A passionate 3rd-year Computer Science and Engineering student with a love for coding and creating innovative solutions. Currently, I'm diving deep into Flutter development to build beautiful and functional mobile applications.",
          textAlign: TextAlign.center, // Center-align text for better readability
          style: TextStyle(
          fontSize: 16, // Reduced font size for mobile
          height: 1.5,
          color: colors.whitePrimary,
          ),
          ),
          ),
          const SizedBox(height: 15),
          // Contact Us Button
          SizedBox(
          width: 200, // Adjust button size for mobile
          child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
          backgroundColor: colors.yellowPrimary, // Button background color
          foregroundColor: Colors.white, // Text color
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4), // Rounded corners
          ),
          ),
          child: const Text("Contact Us"),
          ),
          ),
          ],
          ),
          ),

            /*Container(
              height: Utils.getScreenSize(context).height / 1.2,
              constraints: const BoxConstraints(minHeight: 350.0),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: Utils.getScreenWidth(context) * 0.3, // Adjust size as needed
                    height: Utils.getScreenWidth(context) * 0.3, // Same as width for a perfect circle
                    child: Image.asset(
                      AsstesPath.pic,
                      fit: BoxFit.cover, // Ensures the image fills the circle without distortion
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text("About ",style: TextStyle(
                            fontSize: 30,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                            color: colors.whitePrimary,
                          ),),
                          Text("Me",style: TextStyle(
                            fontSize: 30,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                            color: colors.yellowPrimary,
                          ),)
                        ],
                      ),
                      const SizedBox(height: 14,),
                      SizedBox(
                        width: Utils.getScreenWidth(context)/4,
                        child: const Text(
                          "A passionate 3rd-year Computer Science and Engineering student with a love for coding and creating innovative solutions. Currently, I'm diving deep into Flutter development to build beautiful and functional mobile applications.",
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.5,
                            // fontWeight: FontWeight.w400,
                            color: colors.whitePrimary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors.yellowPrimary, // Button background color
                            foregroundColor: Colors.white, // Text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4), // Rounded corners
                            ),
                          ),
                          child: const Text("Contact Us"),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
            Container(
              height: Utils.getScreenSize(context).height / 1.2,
              constraints: const BoxConstraints(minHeight: 350.0),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50,),
                  // Profile Picture
                  SizedBox(
                    width: Utils.getScreenWidth(context) * 0.5, // 50% of screen width
                    height: Utils.getScreenWidth(context) * 0.5, // Same as width for a perfect circle
                    child: ClipOval(
                      child: Image.asset(
                        AsstesPath.pic,
                        fit: BoxFit.cover, // Ensures the image fills the circle without distortion
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing between picture and text
                  // About Me Section
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "About ",
                        style: TextStyle(
                          fontSize: 24, // Reduced font size for mobile
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: colors.whitePrimary,
                        ),
                      ),
                      Text(
                        "Me",
                        style: TextStyle(
                          fontSize: 24, // Reduced font size for mobile
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: colors.yellowPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // About Me Text
                  SizedBox(
                    width: Utils.getScreenWidth(context) * 0.8, // Adjust width for smaller screens
                    child: const Text(
                      "A passionate 3rd-year Computer Science and Engineering student with a love for coding and creating innovative solutions. Currently, I'm diving deep into Flutter development to build beautiful and functional mobile applications.",
                      textAlign: TextAlign.center, // Center-align text for better readability
                      style: TextStyle(
                        fontSize: 16, // Reduced font size for mobile
                        height: 1.5,
                        color: colors.whitePrimary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Contact Us Button
                  SizedBox(
                    width: 200, // Adjust button size for mobile
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.yellowPrimary, // Button background color
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4), // Rounded corners
                        ),
                      ),
                      child: const Text("Contact Us"),
                    ),
                  ),
                ],
              ),
            ),*/





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
