import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notiva/utils/app_color.dart';

import '../../../Controller/home_controller.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    final PageController _pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("NotiVa"),
        backgroundColor: AppColor.themeColor,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.person)),
          const Text("Hello,Tasnim!"),
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_active)),
        ],
      ),
      drawer: const AppDrawer(),
      bottomNavigationBar: Obx(
            ()=> BottomNavigationBar(
            backgroundColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: AppColor.accentColor,
            unselectedItemColor: Colors.grey,
              currentIndex: controller.selectedIndex.value, // Bind to controller's selectedIndex
              onTap: controller.onTabTapped, // Call onTabTapped to update the page
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.all_inclusive),label: 'All'),
              BottomNavigationBarItem(icon: Icon(Icons.note_alt_outlined),label: 'Projects'),
              BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Personal'),


            ],
          ),
      ),
      body:PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged, // Update index when swiping
        children: const [
          Center(child: Text('All Notes')),  // Placeholder widgets for each tab
          Center(child: Text('Projects Notes')),
          Center(child: Text('Business Notes')),
          Center(child: Text('Personal Notes')),
        ],
      ),
    );
  }
}