import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../Controller/home_controller.dart';
import '../../../utils/app_color.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
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
    );
  }
}