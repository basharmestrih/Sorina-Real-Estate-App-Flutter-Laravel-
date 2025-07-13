import 'package:get/get.dart';
import 'package:my_house_app/app/data/models/home_model.dart';
import 'package:my_house_app/app/modules/property/service/propertyserice.dart';

class PropertyController extends GetxController {
  var houseList = <HomeModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit(); // ✅ should be before fetch
    fetchHouses();
  }

 void fetchHouses({String? location}) async {
  try {
    isLoading.value = true;
    final houses = await ProperttService.fetchHouses(location: location);
    houseList.assignAll(houses);
  } catch (e) {
    Get.snackbar('Error', 'Failed to load houses');
    print('Fetch error: $e');
  } finally {
    isLoading.value = false;
  }
}

}
