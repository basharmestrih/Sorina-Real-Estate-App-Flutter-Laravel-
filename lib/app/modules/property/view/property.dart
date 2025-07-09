import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/data/models/category_model.dart';
import 'package:my_house_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_house_app/app/modules/property/controllers/propertycontroller.dart';
import 'package:my_house_app/app/modules/property/view/widgets/propertycard.dart';
import 'package:my_house_app/app/modules/property/view/widgets/propertychips.dart';
import 'package:my_house_app/app/modules/property/view/widgets/searchbar.dart';

class PropertyView extends StatefulWidget {
  @override
  State<PropertyView> createState() => _PropertyViewState();
}

class _PropertyViewState extends State<PropertyView> {
  int selectedIndex = 0;

  final TextEditingController _searchController = TextEditingController();
  // edit here for API
  final controller = Get.find<PropertyController>();
  //final randomHomes = [...exampleHomes]..shuffle();


  void _onSearchPressed() {
    print("Searching: ${_searchController.text}");
  }

@override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // ✅ Search Bar
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
        child: SearchBarWithButton(
          controller: _searchController,
          onSearch: _onSearchPressed,
        ),
      ),

      const SizedBox(height: 20),

      // ✅ Chips Row with Padding
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 40,
          child:ListView.separated(
  scrollDirection: Axis.horizontal,
  itemCount: CategoryModel.categories.length,
  separatorBuilder: (_, __) => const SizedBox(width: 8),
  itemBuilder: (context, index) {
    return CategoryChip(
      label: CategoryModel.categories[index],
      isSelected: index == selectedIndex,
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  },
),

        ),
      ),

      const SizedBox(height: 16),
      

      // ✅ Property Cards List with Padding
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:ListView.builder(
  itemCount: controller.houseList.length,
  itemBuilder:(_, index) {
    //final home = exampleHomes[index]; // just use first 3 elements
     final home = controller.houseList[index];
     if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: PropertyCard(
        imageUrl: home.imgUrl,
        location: home.location,
        address: home.address,
        name: home.title,
        price: '\$${home.price}',
      ),
    );
  },
),

        ),
      ),
    ],
  );
}

}
