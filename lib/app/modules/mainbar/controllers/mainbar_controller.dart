import 'package:get/get.dart';

class MainbarController extends GetxController {
  var selectedIndex = 0.obs;

  void changeBody(int index) {
    selectedIndex.value = index;
  }
}
