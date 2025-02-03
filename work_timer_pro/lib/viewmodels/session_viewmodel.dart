

import '../my_imports.dart';

class SessionViewModel extends GetxController {
  // Reactive variables for date and timer
  var date = ''.obs; // Make it reactive
  var timerText = '00:00'.obs; // Make it reactive

  // Timer-related variables
  late RxInt seconds;
  late RxInt minutes;
  late RxBool isWorking;

  Timer? timer; // Timer object to control periodic execution

  @override
  void onInit() {
    super.onInit();
    date.value = DateTime.now().toString(); // Set current date as default
    seconds = 0.obs;
    minutes = 0.obs;
    isWorking = false.obs; // Track work session status
  }

  // Start Work method
  void startWork() {
    if (!isWorking.value) {
      isWorking.value = true; // Mark that work session is started
      _startTimer();
    }
  }

  // Method to handle the timer increment
  void _startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (isWorking.value) {
        seconds.value++;
        if (seconds.value == 60) {
          seconds.value = 0;
          minutes.value++;
        }
        // Update the timer text
        timerText.value = '${minutes.value.toString().padLeft(2, '0')}:${seconds.value.toString().padLeft(2, '0')}';
      } else {
        timer.cancel(); // Stop the timer when work is not active
      }
    });
  }

  // Take a break
  void takeBreak() {
    if (isWorking.value) {
      isWorking.value = false;
      // You can add logic for break time here (e.g., pause the timer or show break time)
    }
  }

  // End Work
  void endWork() {
    isWorking.value = false; // End the work session
    timer?.cancel(); // Cancel the timer when work is done
    // Optionally, save the session to the database here
  }
}
