import 'package:get/get.dart';
import 'package:my_house_app/app/data/models/home_model.dart';
import 'package:my_house_app/app/modules/home/services/featured_house_service.dart';

class HomeController extends GetxController {
  final HouseService _houseService = HouseService();

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  Rxn<HomeModel> featuredHouse = Rxn<HomeModel>();

  void fetchFeaturedHouse() async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await _houseService.fetchFeaturedHouse();

    if (result != null) {
      featuredHouse.value = result;
    } else {
      errorMessage.value = 'Failed to load featured house';
    }

    isLoading.value = false;
  }
}
