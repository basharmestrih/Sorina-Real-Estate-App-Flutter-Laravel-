import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/data/models/home_model.dart';
import 'package:my_house_app/app/modules/mainbar/controllers/mainbar_controller.dart';
import 'package:my_house_app/app/modules/home/controllers/home_controller.dart';

class AdvertiseCard extends StatelessWidget {
  const AdvertiseCard({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();



    return Obx(() {
      final house = homeController.featuredHouse.value;




      return GestureDetector(
        onTap: () => Get.find<MainbarController>().changeBody(2),
        child: Container(
          width: double.infinity,
          height: 180.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.secondary,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: house == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ad_label'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: AppColors.black),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'ad_label_ext'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              : Row(
                  children: [
                    // LEFT SIDE: Text details
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(16.r)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(house.title,
                                style: TextStyle(
                                    fontSize: 16.sp, fontWeight: FontWeight.bold)),
                            SizedBox(height: 4.h),
                            Text(house.location,
                                style: TextStyle(color: Colors.grey[600], fontSize: 14.sp)),
                            Text(house.address,
                                style: TextStyle(color: Colors.grey[600], fontSize: 13.sp)),
                            SizedBox(height: 8.h),
                            Text("🛏️ ${house.roomsNumber ?? '-'}    🛁 ${house.bathsNumber ?? '-'}",
                                style: TextStyle(fontSize: 13.sp)),
                          ],
                        ),
                      ),
                    ),

                    // RIGHT SIDE: Image
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(16.r)),
                        child: house.imgUrls.isNotEmpty
                            ? Image.network(
                                house.imgUrls.first,
                                fit: BoxFit.cover,
                                height: double.infinity,
                              )
                            : Container(
                                color: Colors.grey[300],
                                child: Icon(Icons.home, size: 40, color: Colors.grey[600]),
                              ),
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
