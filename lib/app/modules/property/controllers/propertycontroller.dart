import 'package:get/get.dart';
import 'package:my_house_app/app/data/models/home_model.dart';
import 'package:my_house_app/app/modules/property/service/propertyserice.dart';

class PropertyController extends GetxController {
  var houseList = <HomeModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchHouses();
    super.onInit();
  }

  void fetchHouses() async {
    try {
      isLoading(true);
      var houses = await HomeService.fetchHouses();
      houseList.assignAll(houses);
    } finally {
      isLoading(false);
    }
  }
}
