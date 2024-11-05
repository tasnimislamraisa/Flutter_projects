import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Data_Layer/services/fire_store.dart';
import '../../../utils/app_color.dart';

class AllNoteScreen extends StatelessWidget {
  AllNoteScreen({super.key});

  final FireStoreService fireStoreService = FireStoreService();

  // Controller for editing the note
  final TextEditingController _editNoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: fireStoreService.geNotesStream(),
      builder: (context, snapshot) {
        // Check if snapshot has data
        if (!snapshot.hasData) {
          return const Center(
              child:
                  CircularProgressIndicator()); // Show a loading indicator while data is being fetched
        }

        List notesList = snapshot.data!.docs;

        // Handle empty state
        if (notesList.isEmpty) {
          return const Center(child: Text("No notes available"));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10, // Horizontal space between grid items
            mainAxisSpacing: 10, // Vertical space between grid items
            childAspectRatio: 0.75, // Ratio of width to height
          ),
          itemCount: notesList.length, // Number of notes
          itemBuilder: (context, index) {
            // Get Each individual document
            DocumentSnapshot documentSnapshot = notesList[index];
            String docId = documentSnapshot.id;

            // Get note from each document
            Map<String, dynamic> data =
                documentSnapshot.data() as Map<String, dynamic>;
            String noteText = data['note'];

            Timestamp timestamp = data[
                'timestamp']; // Assuming you store 'timestamp' field in Firestore
            DateTime dateTime = timestamp.toDate();

            String formattedDate = DateFormat.yMMMd()
                .add_jm()
                .format(dateTime); // e.g. Aug 23, 2023, 10:00 PM

            return Card(
              color: AppColor.themeColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      noteText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                // Call function to open the edit dialog
                                openEditDialog(docId, noteText);
                                print('Updated note to $noteText');
                              },
                              icon: const Icon(Icons.edit, color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.defaultDialog(
                                  title: "Confirm Delete",
                                  middleText:
                                      "Are you sure you want to delete this note?",
                                  textCancel: "No",
                                  textConfirm: "Yes",
                                  confirmTextColor: Colors.white,
                                  onConfirm: () {
                                    fireStoreService.deleteNote(docId);
                                    Get.back(); // Close the dialog
                                    Get.snackbar(
                                        'Deleted', 'Note deleted successfully',
                                        backgroundColor: AppColor.accentColor,
                                        colorText: Colors.white);
                                  },
                                );
                              },
                              icon:
                                  const Icon(Icons.delete, color: Colors.white),
                            ),
                          ],
                        ),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Function to open the edit dialog
  // Function to open the edit dialog
  void openEditDialog(String docId, String currentNote) {
    _editNoteController.text = currentNote; // Pre-fill the current note text

    Get.defaultDialog(
      title: 'Edit Note',
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: AppColor.themeColor,
      ),
      content: Padding(
        padding:
            const EdgeInsets.all(8.0), // Add padding around the TextFormField
        child: Column(
          children: [
            TextFormField(
              controller: _editNoteController,
              decoration: InputDecoration(
                hintText: 'Edit your note',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      12), // Rounded borders for the TextField
                ),
                filled: true,
                fillColor: AppColor.accentColor, // Light background for input
              ),
              maxLines: 8, // Allow multiple lines for the note
            ),
          ],
        ),
      ),
      barrierDismissible:
          false, // Prevent closing the dialog by tapping outside
      actions: [
        ElevatedButton(
          onPressed: () {
            String updatedNote = _editNoteController.text;
            if (updatedNote.isEmpty) {
              Get.snackbar('Error', 'Note cannot be empty',
                  backgroundColor: Colors.redAccent,
                  colorText:
                      Colors.white); // Show an error if the note is empty
            } else {
              fireStoreService.updateNote(
                  docId, updatedNote); // Update the note in Firestore
              _editNoteController.clear();
              Get.back();
              Get.snackbar('Success', 'Note updated successfully',
                  backgroundColor: AppColor.accentColor,
                  colorText: Colors.grey); // Show success message
            }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded button
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            backgroundColor: AppColor.themeColor, // Theme color for save button
            foregroundColor: Colors.white,
          ),
          child: const Text('Save'),
        ),
        ElevatedButton(
          onPressed: () {
            _editNoteController.clear();
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
