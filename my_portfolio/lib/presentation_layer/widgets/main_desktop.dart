import 'package:flutter/material.dart';

import '../components/color.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    final screenWith=screenSize.width;
    return Container(
      height: screenSize.height/1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hi,\nI'm Tasnim Islam Raisa\nA Flutter Developer",
                style:TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: colors.whitePrimary,
                ),
              ),
              const SizedBox(height: 15,),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Get in touch"),
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/images/dp.jpg",
            width: screenWith/2,

          ),
        ],
      ),
    );
  }
}
