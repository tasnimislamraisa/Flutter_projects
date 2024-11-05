import 'package:get/get.dart';
import '../Data_Layer/models/product_model.dart';
import '../Data_Layer/network/NetworkCaller.dart';
import '../Data_Layer/network/network_response.dart';
import '../utils/url.dart';

class NoteController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var noteList = <Product>[].obs; // Observable list of notes

  // Add Note function using POST request
  Future<void> addNote(Product newNote) async {
    try {
      isLoading(true);
      errorMessage('');

      final Map<String, dynamic> noteData = newNote.toJson();
      final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
        url: Urls.createProductUrl, // Replace with your add note endpoint
        body: noteData,
      );

      if (response.isSuccess) {
        // Parse the response if needed and add it to noteList
        noteList.add(Product.fromJson(response.responseData)); // Add new note to the list
        Get.snackbar('Success', 'Note added successfully!');
      } else {
        errorMessage('Failed to add note');
        Get.snackbar('Error', response.errorMsg ?? 'Unknown error');
      }
    } catch (e) {
      errorMessage('Error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

  // Fetch Notes using GET request
  Future<void> fetchNotes() async {
    try {
      isLoading(true);
      errorMessage('');

      final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        url: Urls.readProductUrl, // Replace with your get notes endpoint
      );

      if (response.isSuccess) {
        List<dynamic> data = response.responseData;
        noteList.value = data.map((item) => Product.fromJson(item)).toList(); // Update the note list
      } else {
        errorMessage('Failed to load notes');
      }
    } catch (e) {
      errorMessage('Error occurred: $e');
    } finally {
      isLoading(false);
    }
  }
}
