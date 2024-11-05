import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Reactive index to track the selected page
  var selectedIndex = 0.obs;

  // PageController to manage PageView
  PageController pageController = PageController();

  // Method to change the page index
  void onTabTapped(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index); // Change PageView when a tab is tapped
  }

  // Method to update the index when PageView is swiped
  void onPageChanged(int index) {
    selectedIndex.value = index;
  }
}
