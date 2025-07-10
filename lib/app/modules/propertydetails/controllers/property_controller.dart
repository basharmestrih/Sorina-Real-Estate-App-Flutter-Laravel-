
import 'package:get/get.dart';

class PropertyDetailsController extends GetxController {
  var selectedIndex = 0.obs;

  void changeBody(int index) {
    selectedIndex.value = index;
  }
}



