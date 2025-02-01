import 'my_imports.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Paw Detector',
      debugShowCheckedModeBanner: true,
      home: MySplashScreen(),
    );
  }
}