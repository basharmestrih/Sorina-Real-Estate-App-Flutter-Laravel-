import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/controller/adding_engineer_controller.dart';
import 'package:my_house_app/app/widgets/input_text_form_field_with_label.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/Appbar.dart';
import 'package:my_house_app/generated/locales.g.dart';

class AddingEngineer extends StatelessWidget {
  AddingEngineer({super.key});

  final AddingEngineerController controller = Get.put(AddingEngineerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile'.tr, // Localized title
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.fontcolor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 16.h),
            _buildCardSection(
              context,
              children: [
                _buildInput(context, LocaleKeys.engineer_name_label.tr, LocaleKeys.engineer_name_hint.tr, controller.nameController),
                _buildInput(context, LocaleKeys.engineer_specialization_label.tr, LocaleKeys.engineer_specialization_hint.tr, controller.specializationController),
                _buildInput(context, LocaleKeys.university_label.tr, LocaleKeys.university_hint.tr, controller.universityController),
                _buildInput(context, LocaleKeys.country_label.tr, LocaleKeys.country_hint.tr, controller.countryController),
                _buildInput(context, LocaleKeys.city_label.tr, LocaleKeys.city_hint.tr, controller.cityController),
                _buildInput(context, LocaleKeys.experience_label.tr, LocaleKeys.experience_hint.tr, controller.experienceController),
                _buildInput(context, LocaleKeys.languages_label.tr, LocaleKeys.languages_hint.tr, controller.languagesController),
                _buildInput(context, LocaleKeys.years_experience_label.tr, LocaleKeys.years_experience_hint.tr, controller.yearsExperienceController),
                _buildInput(context, LocaleKeys.engineer_phone_label.tr, LocaleKeys.engineer_phone_hint.tr, controller.phoneController),
                _buildFilePicker(context), // Add file picker
              ],
            ),
            SizedBox(height: 32.h),
            ResponsiveButton(
              clickable: true,
              onPressed: () {
                controller.submitProfile(); // Submit profile
              },
              buttonHeight: 50.h,
              buttonStyle: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                minimumSize: Size(double.infinity, 50.h),
              ),
              child: Text(
                'Save Profile'.tr, // Localized button text
                style: TextStyle(
                  color: AppColors.fontcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
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
          style: TextStyle(color: AppColors.fontcolor, fontSize: 15.sp,),
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.withOpacity(0.5),
            hintStyle: TextStyle(fontSize: 15.sp, color: AppColors.lightGrey),
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

Widget _buildFilePicker(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Profile Image'.tr, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.fontcolor)),
      SizedBox(height: 8.h),
      Obx(() {
        return GestureDetector(
          onTap: () {
            controller.pickFile(); // Pick file on tap
          },
          child: Container(
            width: double.infinity,
            height: 150.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.white24),
            ),
            child: controller.selectedFile.value != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.file(
                      controller.selectedFile.value!,
                      fit: BoxFit.cover,
                    ),
                  )
                : Center(
                    child: Text(
                      'Tap to pick an image'.tr, // Localized prompt
                      style: TextStyle(color: AppColors.lightGrey),
                    ),
                  ),
          ),
        );
      }),
    ],
  );
}


}
