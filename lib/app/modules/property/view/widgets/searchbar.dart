import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';

class SearchBarWithButton extends StatelessWidget {
  final VoidCallback onSearch;
  final TextEditingController controller;

  const SearchBarWithButton({
    required this.onSearch,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     
      decoration: BoxDecoration(
         color: AppColors.lightGrey,
        //color: AppColors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          // Borderless TextField
          Expanded(
            child: TextField(
              controller: controller,
              decoration:  InputDecoration(
                 fillColor: AppColors.lightGrey,
                hintText: 'search_label_hint'.tr,
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ResponsiveButton(
                    onPressed: () {
                      
                    },
                    clickable: true,

                    buttonStyle: ButtonStyle(


                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                      ),
                    ),
                    buttonWidth: Get.width/4,
                    child: Text( 'button_search'.tr,),
                  ),

          // Search Button
          /*ElevatedButton(
            onPressed: onSearch,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber[400],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Search',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
