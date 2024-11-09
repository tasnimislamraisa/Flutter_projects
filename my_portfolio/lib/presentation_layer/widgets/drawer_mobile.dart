import 'package:flutter/material.dart';

import '../components/color.dart';
import '../components/nav_item.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colors.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
              child: IconButton(onPressed: (){
                Navigator.of(context).pop();
              },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
          ),
          for(int i=0;i<navIcons.length;++i)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
              leading: Icon(navIcons[i]),
              title: Text(navTitles[i],),
              titleTextStyle:const TextStyle(
                  color: colors.whitePrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
              onTap: (){},
            ),
        ],
      ),
    );
  }
}
