import '../my_imports.dart';

class RegisterScreen extends StatelessWidget {
  final DBHelper dbHelper = DBHelper.instance; // Singleton access
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController(); // For user/admin role

  Future<void> registerUser(String email, String password, String role) async {
    // Ensure email doesn't already exist
    final users = await dbHelper.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (users.isNotEmpty) {
      Get.snackbar('Error', 'Email already registered');
      return;
    }

    // Insert new user into the database
    await dbHelper.insert('users', {
      'email': email,
      'password': password,
      'role': role, // 'user' or 'admin'
    });

    Get.snackbar('Success', 'User registered successfully');
    Get.off(() => LoginScreen()); // Navigate to login screen after successful registration
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            TextField(controller: roleController, decoration: InputDecoration(labelText: 'Role (user/admin)')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => registerUser(
                emailController.text.trim(),
                passwordController.text.trim(),
                roleController.text.trim(),
              ),
              child: Text('Register'),
            ),
            TextButton(
              onPressed: () => Get.to(() => LoginScreen()),
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
