import '../my_imports.dart';

class LoginScreen extends StatelessWidget {
  final DBHelper dbHelper = DBHelper.instance; // Singleton access
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

 /* Future<void> loginUser(String email, String password) async {
    final users = await dbHelper.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (users.isNotEmpty) {
      final user = users.first;
      if (user['role'] == 'admin') {
        Get.off(() => AdminDashboard());
      } else {
        Get.off(() => UserDashboard(userId: user['id']));
      }
    } else {
      Get.snackbar('Error', 'Invalid email or password');
    }
  }*/
  // Assuming the 'userId' is fetched from the database after successful login
  Future<void> loginUser(String email, String password) async {
    final users = await dbHelper.query('users', where: 'email = ? AND password = ?', whereArgs: [email, password]);

    if (users.isNotEmpty) {
      final user = users.first;
      if (user['role'] == 'admin') {
        Get.off(() => AdminDashboard());
      } else {
        // Pass the userId to the UserDashboard
        Get.off(() => UserDashboard(userId: user['id'])); // Add the userId here
      }
    } else {
      Get.snackbar('Error', 'Invalid email or password');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => loginUser(emailController.text.trim(), passwordController.text.trim()),
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () => Get.to(() => RegisterScreen()),
              child: Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
