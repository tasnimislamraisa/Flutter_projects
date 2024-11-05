import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../Data_Layer/services/fire_store.dart';
import '../../../utils/app_color.dart';
import '../widgets/drawer.dart';
import 'all_note_screen.dart';
import 'auth/auth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _addNoteController=TextEditingController();

  final FireStoreService fireStoreService=FireStoreService();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String userName = '';

  @override
  void initState() {
    super.initState();
    getUserName(); // Fetch the user's name when the screen loads
  }

 // Variable to hold the user's name
  Future<void> getUserName() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        setState(() {
          userName = userDoc['name']; // Fetch and set the user's name
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //final user=FirebaseAuth.instance.currentUser!;
    final user = FirebaseAuth.instance.currentUser!;

    // final HomeController controller = Get.put(HomeController());
    //final PageController _pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("NotiVa"),
            //Spacer(),
            Flexible(
              child: Text(
                "Hello, $userName!",
                overflow: TextOverflow.ellipsis, // Prevent overflow
                style: const TextStyle(fontSize: 12), // Smaller font to prevent overflow
              ),
            ),
          ],
        ),
        backgroundColor: AppColor.themeColor,
        actions: [
          //IconButton(onPressed: (){}, icon: const Icon(Icons.person)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_active)),
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
            Get.snackbar('Logout', 'Successful',
                snackPosition: SnackPosition.BOTTOM);
            Get.offAll(() => const AuthScreen()); // Use Get.offAll to remove all previous routes
          }, icon: const Icon(Icons.logout)),
        ],
      ),

      drawer: AppDrawer(),
   //   bottomNavigationBar: BottomNavBarWidget(controller: controller),
      body : AllNoteScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed:openNoteBox,
        backgroundColor: AppColor.themeColor,
        foregroundColor: Colors.white,
      child:const Icon(Icons.add_circle_rounded),
      ),
    );
  }

  /*void openNoteBox(){
    Get.defaultDialog(
        title: 'Add Note', // You can set any string as the title
        content: TextFormField(
          controller: _addNoteController,
          decoration: const InputDecoration(hintText: 'Enter your note'),
        ),
        actions: [
          ElevatedButton(onPressed: (){
            fireStoreService.addNote(_addNoteController.text);
            _addNoteController.clear();
            Get.back();
            print('Added A New Note');
            //Get.off(()=>HomeScreen());
          }, child: const Text("Add")),
          ElevatedButton(onPressed: (){
            _addNoteController.clear();
            Get.back();
            //Get.off(()=>HomeScreen());
          }, child: const Text("Cancel")),
        ]
    );

  }*/
  void openNoteBox() {
    Get.defaultDialog(
      title: 'Add Note',
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: AppColor.themeColor,
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding around the TextFormField
        child: Column(
          children: [
            SingleChildScrollView(
              child: TextFormField(
                controller: _addNoteController,
                decoration: InputDecoration(
                  hintText: 'Enter your note',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded borders for the TextField
                  ),
                  filled: true,
                  fillColor: AppColor.accentColor, // Light background for input
                ),
                maxLines: 8, // Allow multiple lines for the note
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false, // Prevent closing the dialog by tapping outside
      actions: [
        ElevatedButton(
          onPressed: () {
            if (_addNoteController.text.isEmpty) {
              Get.snackbar('Error', 'Note cannot be empty', backgroundColor: Colors.redAccent, colorText: Colors.white); // Show an error if the note is empty
            } else {
              fireStoreService.addNote(_addNoteController.text);
              _addNoteController.clear();
              Get.back();
              Get.snackbar('Success', 'Added a new note', backgroundColor: AppColor.accentColor, colorText: Colors.grey); // Show success message
              print('Added A New Note');
            }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded button
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            backgroundColor: AppColor.themeColor,
            foregroundColor: Colors.white
          ),
          child: const Text('Add'),
        ),
        ElevatedButton(
          onPressed: () {
            _addNoteController.clear();
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey, // Different color for cancel
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}

/*:PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged, // Update index when swiping
        children: [
          AllNoteScreen(),  // Placeholder widgets for each tab
          Center(child: Text('Projects Notes')),
          Center(child: Text('Business Notes')),
          Center(child: Text('Personal Notes')),
        ],
      ),*/

