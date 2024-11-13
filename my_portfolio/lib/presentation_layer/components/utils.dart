import 'my_imports.dart';

class Utils{
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}