import '../my_imports.dart';

class UserDashboard extends StatelessWidget {
  final int userId; // Declare the userId parameter

  // Constructor to receive the userId
  const UserDashboard({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Handle logout functionality here
              Get.offAll(() => LoginScreen());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome User #$userId',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Work Timer screen
                Get.to(() => WorkTimerScreen());
              },
              child: const Text('Start Work Timer'),
            ),
            // Add other buttons or widgets as per your requirements
          ],
        ),
      ),
    );
  }
}
