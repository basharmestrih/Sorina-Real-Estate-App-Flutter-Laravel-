import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/data/services/locale_service.dart';
import 'package:my_house_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:my_house_app/app/routes/app_pages.dart';

class SideMenu extends StatelessWidget {
  final VoidCallback onToggleLanguage;

  const SideMenu({super.key, required this.onToggleLanguage});

  @override
  Widget build(BuildContext context) {
    //final authController = Get.find<AuthController>();

    final LocaleService localeService = Get.find();

    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerItem(title: 'home'.tr, icon: Icons.home, onTap: () {}),
            SizedBox(height: 16.sp),
            DrawerItem(title: 'Dashboard'.tr, icon: Icons.dashboard, onTap: () {
              Get.toNamed(Routes.DashBoard);
            }),
            SizedBox(height: 16.sp),
            DrawerItem(title: 'properties_sale'.tr, icon: Icons.sell, onTap: () {}),
            SizedBox(height: 16.sp),
            DrawerItem(title: 'properties_rent'.tr, icon: Icons.apartment, onTap: () {}),
            SizedBox(height: 16.sp),
            DrawerItem(title: 'farms_sale'.tr, icon: Icons.nature, onTap: () {}),
            SizedBox(height: 16.sp),
            DrawerItem(title: 'ask_consultant'.tr, icon: Icons.engineering, onTap: () {}),
            SizedBox(height: 16.sp),
            DrawerItem(title: 'logout_button'.tr, icon: Icons.logout, onTap: () async {
              //await authController.logout();
            },),
             SizedBox(height: 16.sp),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('language_switch'.tr, style: TextStyle(fontSize: 16.sp,color:Colors.grey[600])),
                Switch(
                  activeColor: Colors.grey,
                  value: Get.locale?.languageCode == 'ar',
                  onChanged: (bool value) {
                    localeService.toggleLocale();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title, style: TextStyle(fontSize: 20.sp)),
      onTap: onTap,
    );
  }
}
