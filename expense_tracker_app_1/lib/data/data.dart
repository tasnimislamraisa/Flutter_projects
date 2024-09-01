import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<Map<String, dynamic>> myTransavtionData = [
  {
    'icon': const FaIcon(FontAwesomeIcons.burger,color: Colors.white,),
    'color': Colors.yellow[700],
    'name': 'Food',
    'totalAmount': '45.00/-',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.bagShopping,color: Colors.white,),
    'color': Colors.deepPurpleAccent,
    'name': 'Shopping',
    'totalAmount': '150.00/-',
    'date': 'Yesterday',
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.heartCircleCheck,color: Colors.white,),
    'color': Colors.redAccent[700],
    'name': 'Health',
    'totalAmount': '80.00/-',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.plane,color: Colors.white,),
    'color': Colors.blue[700],
    'name': 'Travel',
    'totalAmount': '45.00/-',
    'date': 'Yesterday',
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.appStore,color: Colors.white,),
    'color': Colors.yellow[700],
    'name': 'App',
    'totalAmount': '3500.00/-',
    'date': 'Today',
  },
];
