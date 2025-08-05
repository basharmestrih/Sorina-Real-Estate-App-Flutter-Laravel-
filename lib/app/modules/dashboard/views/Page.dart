import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/dashboard/controller/DashBoardController.dart';
import 'package:my_house_app/app/modules/dashboard/views/widgets/ActionCard.dart';
import 'package:my_house_app/app/modules/dashboard/views/widgets/Appbar.dart';

class DashBoardPage extends GetView<DashBoardController> {
  const DashBoardPage({Key? key}) : super(key: key);

  static List<String> get pagenames {
    // Check the current locale and return the appropriate names
    if (Get.locale?.languageCode == 'ar') {
      return [
        'إضافة منزل',
        'حذف منزل',
        'عرض منزل',
        'إضافة مهندس',
      ];
    } else {
      return [
        'Add Property',
        'Delete Property',
        'Show Properties',
        'Add Engineer',
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 5.w),
        child: GridView.builder(
          itemCount: pagenames.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            mainAxisSpacing: 48.h,
            crossAxisSpacing: 8.h,
            childAspectRatio: 0.75.h,
          ),
          itemBuilder: (context, index) {
            final pagename = pagenames[index];
            return ActionCard(
              pagename: pagename,
              onTap: () => controller.onCardTap(index),
            );
          },
        ),
      ),
    );
  }
}
