import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });
  //Widget _buildDrawerTile(IconData icon, String title, Widget page) {
  Widget _buildDrawerTile(IconData icon, String title, ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () { },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.themeColor,
      child: ListView(
        children:  [
          const DrawerHeader(
            child: Column(
              children: [
                Icon(Icons.person,size: 90,),
                Text("Tasnim Islam Raisa"),
              ],
            ),
          ),
          _buildDrawerTile(Icons.grid_view_rounded, 'OverView', ),
          _buildDrawerTile(Icons.event_note, 'Task', ),
          _buildDrawerTile(Icons.note_alt_outlined, 'Documents', ),
          _buildDrawerTile(Icons.edit_note, 'Notes', ),
          _buildDrawerTile(Icons.auto_graph_sharp, 'Output', ),
          _buildDrawerTile(Icons.headphones, 'Support', ),
          _buildDrawerTile(Icons.edit, 'Edit Profile', ),


        ],
      ),


    );
  }
}