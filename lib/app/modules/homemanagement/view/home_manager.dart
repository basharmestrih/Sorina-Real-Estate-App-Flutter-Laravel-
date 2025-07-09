import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/modules/homemanagement/controller/HomemanagerController.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/widgets/input_text_form_field.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/app/modules/homemanagement/view/widgets/Appbar.dart';

class PropertyManager extends StatelessWidget {
  const PropertyManager({super.key});

  @override
  Widget build(BuildContext context) {
    final PropertyManagerController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 10, 40, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputTextFormField(
              hintText: 'Title',
              obsecure: false,
              textEditingController: controller.titleController,
              width: 300.w,
            ),
            SizedBox(height: 24.h),
            InputTextFormField(
              hintText: 'Description',
              obsecure: false,
              textEditingController: controller.descriptionController,
               width: 300.w,
            ),
            SizedBox(height: 24.h),
            InputTextFormField(
              hintText: 'Price',
              obsecure: false,
              textEditingController: controller.priceController,
               width: 300.w,
            ),
            SizedBox(height: 24.h),
            InputTextFormField(
              hintText: 'Bedrooms',
              obsecure: false,
              textEditingController: controller.bedroomsController,
               width: 300.w,
            ),
            SizedBox(height: 24.h),
            InputTextFormField(
              hintText: 'Bathrooms',
              obsecure: false,
              textEditingController: controller.bathroomsController,
               width: 300.w,
            ),
            SizedBox(height: 24.h),
            InputTextFormField(
              hintText: 'Area',
              obsecure: false,
              textEditingController: controller.areaController,
               width: 300.w,
            ),
            SizedBox(height: 24.h),
            InputTextFormField(
              hintText: 'Address',
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
            'Add Property to Database',
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
