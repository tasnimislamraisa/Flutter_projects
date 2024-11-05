import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/note_controller.dart';
import '../../../Data_Layer/models/product_model.dart';
import '../../../utils/app_color.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller for title TextField
    final TextEditingController titleController = TextEditingController();
    // Controller for note content TextField
    final TextEditingController contentController = TextEditingController();
    final NoteController controller = Get.find<NoteController>();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: titleController,
          style: const TextStyle(color: Colors.white), // White text
          decoration: const InputDecoration(
            hintText: 'Enter Your Title Here',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none, // Remove the underline from TextField
          ),
        ),
        backgroundColor: AppColor.themeColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // Ensure both fields are filled before saving the note
              if (titleController.text.isNotEmpty &&
                  contentController.text.isNotEmpty) {
                Product newNote = Product(
                  title: titleController.text,
                  content: contentController.text,
                  dateCreated: DateTime.now().toString(),
                );

                // Call the addNote method to add the note
                controller.addNote(newNote);

                // Go back to the previous screen
                Get.back();
              } else {
                Get.snackbar('Error', 'Please fill both fields');
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: contentController,
          maxLines: null, // Allow multiline input
          style: const TextStyle(fontSize: 18),
          decoration: const InputDecoration(
            hintText: 'Enter your note here...',
            border: InputBorder.none, // No border for the TextField
          ),
        ),
      ),
    );
  }

  Future<void> saveButton() async {
    // Save button functionality if needed
  }
}
