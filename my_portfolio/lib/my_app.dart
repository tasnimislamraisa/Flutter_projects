import 'presentation_layer/components/my_imports.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Portfolio",
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
