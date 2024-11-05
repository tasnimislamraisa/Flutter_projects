import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'Controller/home_controller.dart';


class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(Logger());
    Get.lazyPut(()=>HomeController());
    //Get.put(ReadProductController());
  }

}