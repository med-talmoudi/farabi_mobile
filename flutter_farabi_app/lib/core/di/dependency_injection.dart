import 'package:flutter_farabi_app/core/controller/network_controller.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init(){
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}