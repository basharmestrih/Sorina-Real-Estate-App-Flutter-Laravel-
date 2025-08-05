import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/controller/HomemanagerController.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/widgets/input_text_form_field_with_label.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/Appbar.dart';
import 'package:my_house_app/generated/locales.g.dart'; // Make sure this points to your LocaleKeys file

class PropertyManager extends StatelessWidget {
  const PropertyManager({super.key});
  


  

  @override
  Widget build(BuildContext context) {
  final PropertyManagerController controller = Get.put(PropertyManagerController());
    //show on time line feature
    bool showOnTimeline = false;

    

return Scaffold(
  backgroundColor: AppColors.primary,
  appBar: CustomAppBar(),
  body: SingleChildScrollView(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'adding_tip'.tr,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.fontcolor,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(height: 16.h),

        _buildCardSection(
          context,
          children: [
            _buildInput(context, LocaleKeys.title_label.tr, LocaleKeys.title_hint.tr, controller.titleController),
            _buildInput(context, LocaleKeys.description_label.tr, LocaleKeys.description_hint.tr, controller.descriptionController),
            _buildInput(context, LocaleKeys.price_label.tr, LocaleKeys.price_hint.tr, controller.priceController),
            _buildInput(context, LocaleKeys.bedrooms_label.tr, LocaleKeys.bedrooms_hint.tr, controller.bedroomsController),
            _buildInput(context, LocaleKeys.bathrooms_label.tr, LocaleKeys.bathrooms_hint.tr, controller.bathroomsController),
            _buildInput(context, LocaleKeys.area_label.tr, LocaleKeys.area_hint.tr, controller.areaController),
            _buildInput(context, LocaleKeys.address_label.tr, LocaleKeys.address_hint.tr, controller.addressController),
            _buildInput(context, 'Location', 'Palm Jumeirah', controller.locationController),
          ],
        ),

        SizedBox(height: 24.h),
        Text(
          "Additional Info",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.fontcolor,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(height: 16.h),

        _buildCardSection(
          context,
          children: [
            _buildInput(context, 'Floors Number', 'e.g., 2', controller.floorsNumberController),
            _buildInput(context, 'Ground Distance', 'e.g., 15', controller.groundDistanceController),
            _buildInput(context, 'Building Age', 'e.g., 3', controller.buildingAgeController),
            _buildInput(context, 'Main Feature 1', 'e.g., Sea view', controller.feature1Controller),
            _buildInput(context, 'Main Feature 2', 'e.g., Swimming Pool', controller.feature2Controller),
            _buildInput(context, 'Main Feature 3', 'e.g., Garden', controller.feature3Controller),
          ],
        ),

        SizedBox(height: 24.h),
        Text(
          "Media",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.fontcolor,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(height: 16.h),

        GetBuilder<PropertyManagerController>(
          builder: (_) => _buildCardSection(
            context,
            children: [
              Row(
                children: [
                  Icon(Icons.image, color: AppColors.fontcolor),
                  SizedBox(width: 8.w),
                  ElevatedButton(
                    onPressed: controller.pickImages,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text("Pick Images"),
                  ),
                  SizedBox(width: 12.w),
                  Text("${controller.selectedImages.length} selected",
                      style: TextStyle(color: AppColors.fontcolor)),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Icon(Icons.video_collection, color: AppColors.fontcolor),
                  SizedBox(width: 8.w),
                  ElevatedButton(
                    onPressed: controller.pickVideo,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text("Pick Video"),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    controller.selectedVideo != null ? "Video selected" : "No video",
                    style: TextStyle(color: AppColors.fontcolor),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 32.h),
        Text(
  "Display on timeline",
  style: Theme.of(context).textTheme.titleLarge!.copyWith(
    color: AppColors.fontcolor,
    fontWeight: FontWeight.bold,
  ),
),
SizedBox(height: 12.h),
GetBuilder<PropertyManagerController>(
  builder: (controller) => Row(
    children: [
      Checkbox(
        value: controller.showOnTimeline,
        onChanged: (value) {
          controller.setShowOnTimeline(value ?? false);
        },
        activeColor: AppColors.secondary,
      ),
      Text(
        "Show on timeline (homepage)",
        style: TextStyle(color: AppColors.fontcolor),
      ),
    ],
  ),
),
SizedBox(height: 32.h),
      ],
    ),
  ),
  bottomNavigationBar: Padding(
    padding: EdgeInsets.all(16.r),
    child: ResponsiveButton(
      clickable: true,
      onPressed: controller.submitProperty,
      buttonHeight: 50.h,
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        minimumSize: Size(double.infinity, 50.h),
      ),
      child: Text(
        LocaleKeys.submit_property.tr,
        style: TextStyle(
          color: AppColors.fontcolor,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
      ),
    ),
  ),
);

  }
  Widget _buildCardSection(BuildContext context, {required List<Widget> children}) {
  return Container(
    padding: EdgeInsets.all(16.r),
    margin: EdgeInsets.only(bottom: 24.h),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: Colors.white10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
          .expand((widget) => [widget, SizedBox(height: 20.h)])
          .toList()
        ..removeLast(),
    ),
  );
}

Widget _buildInput(BuildContext context, String label, String hint, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.fontcolor)),
      SizedBox(height: 8.h),
      TextFormField(
        controller: controller,
        style: TextStyle(color: AppColors.fontcolor),
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.withOpacity(0.5),
          hintStyle: TextStyle(fontSize: 15.sp,color: AppColors.lightGrey),
          contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.white24),
          ),
        ),
      ),
    ],
  );
}

}
