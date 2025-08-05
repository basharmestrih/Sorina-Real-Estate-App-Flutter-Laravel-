import 'package:get/get.dart';
import 'package:my_house_app/app/data/services/locale_service.dart';
import 'package:my_house_app/app/modules/auth/controllers/auth_controller.dart';

class MainbarController extends GetxController {
   //final authController = Get.find<AuthController>();
  var selectedIndex = 0.obs;

  void changeBody(int index) {
    selectedIndex.value = index;
  }
}
