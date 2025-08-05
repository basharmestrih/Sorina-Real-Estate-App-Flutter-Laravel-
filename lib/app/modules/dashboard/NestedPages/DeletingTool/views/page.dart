import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/DeletingTool/controller/DeletingToolController.dart';
import 'package:my_house_app/app/modules/dashboard/views/widgets/Appbar.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/widgets/input_text_form_field_with_label.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/generated/locales.g.dart'; // Make sure this points to your LocaleKeys file

class Deletingtool extends StatelessWidget {
  const Deletingtool({super.key});
  


  

  @override
  Widget build(BuildContext context) {
    final DeletingToolController controller = Get.find();


    

return Scaffold(
  backgroundColor: AppColors.primary,
  appBar: CustomAppBar(),
  body: SingleChildScrollView(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        SizedBox(height: 48.h),
         Text(
          "deleting_tip".tr,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),

        _buildCardSection(
          context,
          children: [
            _buildInput(context,  'e.g: 12', controller.idcontroller),

          ],
        ),

        

      ],
    ),
  ),
  bottomNavigationBar: Padding(
    padding: EdgeInsets.all(16.r),
    child: ResponsiveButton(
      clickable: true,
      onPressed: controller.deleteProperty,
      buttonHeight: 50.h,
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        minimumSize: Size(double.infinity, 50.h),
      ),
      child: Text(
        LocaleKeys.delete_button.tr,
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

Widget _buildInput(BuildContext context,  String hint, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 48.h),
      TextFormField(
        controller: controller,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center ,
        style: TextStyle(color: AppColors.fontcolor),
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.withOpacity(0.5),
          hintStyle: TextStyle(fontSize: 25.sp,color: AppColors.lightGrey),
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
