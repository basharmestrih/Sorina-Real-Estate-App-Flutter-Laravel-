import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/modules/homemanagement/controller/HomemanagerController.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/widgets/input_text_form_field.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/app/modules/homemanagement/view/widgets/Appbar.dart';
import 'package:my_house_app/generated/locales.g.dart'; // Make sure this points to your LocaleKeys file

class PropertyManager extends StatelessWidget {
  const PropertyManager({super.key});

  @override
  Widget build(BuildContext context) {
    final PropertyManagerController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 60, 40, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputTextFormField(
              labelTextAboveTextField: Text(
                LocaleKeys.title_label.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              hintText: LocaleKeys.title_hint.tr,
              obsecure: false,
              textEditingController: controller.titleController,
              width: 300.w,
            ),
            SizedBox(height: 32.h),
            InputTextFormField(
              labelTextAboveTextField: Text(
                LocaleKeys.description_label.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              hintText: LocaleKeys.description_hint.tr,
              obsecure: false,
              textEditingController: controller.descriptionController,
              width: 300.w,
            ),
            SizedBox(height: 32.h),
            InputTextFormField(
              labelTextAboveTextField: Text(
                LocaleKeys.price_label.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              hintText: LocaleKeys.price_hint.tr,
              obsecure: false,
              textEditingController: controller.priceController,
              width: 300.w,
            ),
            SizedBox(height: 32.h),
            InputTextFormField(
              labelTextAboveTextField: Text(
                LocaleKeys.bedrooms_label.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              hintText: LocaleKeys.bedrooms_hint.tr,
              obsecure: false,
              textEditingController: controller.bedroomsController,
              width: 300.w,
            ),
            SizedBox(height: 32.h),
            InputTextFormField(
              labelTextAboveTextField: Text(
                LocaleKeys.bathrooms_label.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              hintText: LocaleKeys.bathrooms_hint.tr,
              obsecure: false,
              textEditingController: controller.bathroomsController,
              width: 300.w,
            ),
            SizedBox(height: 32.h),
            InputTextFormField(
              labelTextAboveTextField: Text(
                LocaleKeys.area_label.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              hintText: LocaleKeys.area_hint.tr,
              obsecure: false,
              textEditingController: controller.areaController,
              width: 300.w,
            ),
            SizedBox(height: 32.h),
            InputTextFormField(
              labelTextAboveTextField: Text(
                LocaleKeys.address_label.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              hintText: LocaleKeys.address_hint.tr,
              obsecure: false,
              textEditingController: controller.addressController,
              width: 300.w,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.r),
        child: ResponsiveButton(
          clickable: true,
          onPressed: () {
            controller.submitProperty();
          },
          buttonHeight: 50,
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
}
