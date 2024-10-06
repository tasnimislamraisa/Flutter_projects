import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:notiva/Controller/home_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(Logger());
    Get.lazyPut(()=>HomeController());
  }

}