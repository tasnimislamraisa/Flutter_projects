import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Squaretile extends StatelessWidget {
  const Squaretile({super.key, required this.imagePath, this.onTap});
  final String imagePath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Image.asset(imagePath,height: 40,fit: BoxFit.fitHeight,),
      ),
    );
  }
}
