import 'my_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure the database is initialized before running the app
  await DBHelper.instance.database;

  runApp(WorkTimeProApp());
}



