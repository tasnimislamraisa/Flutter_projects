import 'my_imports.dart';

class WorkTimeProApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WorkTime Pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/user_dashboard', page: () => UserDashboard(userId: 1,)),
        GetPage(name: '/admin_dashboard', page: () => AdminDashboard()),
        GetPage(name: '/work_timer', page: () => WorkTimerScreen()),
      ],
    );
  }
}