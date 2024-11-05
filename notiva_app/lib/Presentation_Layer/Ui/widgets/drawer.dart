import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/app_color.dart';
import '../Screens/auth/reset_pass_screen.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to fetch the user's name from Firestore
  Future<String> getUserName() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        return userDoc['name']; // Fetch the 'name' field from the user's document
      }
    }
    return 'User'; // Default name if no name is found
  }

  // Method to build the drawer tile
  Widget _buildDrawerTile(IconData icon, String title,VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.themeColor,
      child: ListView(
        children: [
          FutureBuilder<String>(
            future: getUserName(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const DrawerHeader(
                  child: Column(
                    children: [
                      Icon(Icons.person, size: 90),
                      CircularProgressIndicator(), // Show loading indicator while fetching
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return const DrawerHeader(
                  child: Column(
                    children: [
                      Icon(Icons.person, size: 90),
                      Text('Error fetching name'),
                    ],
                  ),
                );
              } else {
                return DrawerHeader(
                  child: Column(
                    children: [
                      const Icon(Icons.person, size: 90),
                      Text(snapshot.data ?? 'User'), // Display the fetched user name
                    ],
                  ),
                );
              }
            },
          ),
          _buildDrawerTile(Icons.grid_view_rounded, 'Overview',(){}),
          _buildDrawerTile(Icons.event_note, 'Task',(){}),
          _buildDrawerTile(Icons.note_alt_outlined, 'Documents',(){}),
          _buildDrawerTile(Icons.edit_note, 'Notes',(){}),
          _buildDrawerTile(Icons.auto_graph_sharp, 'Output',(){}),
          _buildDrawerTile(Icons.headphones, 'Support',(){}),
          _buildDrawerTile(Icons.edit, 'Edit Profile',(){}),
          _buildDrawerTile(Icons.lock_reset, 'Reset Password',(){
            Get.to(const SetPasswordScreen());
          }),
          _buildDrawerTile(Icons.logout, 'LogOut',(){
            FirebaseAuth.instance.signOut();
            Get.snackbar('Logout', 'Successful',
                snackPosition: SnackPosition.BOTTOM);
          }),
        ],
      ),
    );
  }
}
