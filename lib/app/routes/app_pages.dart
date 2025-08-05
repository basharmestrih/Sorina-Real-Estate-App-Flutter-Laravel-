import 'package:get/get.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/bindings/adding_engineer_bindings.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/view/adding_engineer.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/DeletingTool/bindings/DeletingToolBindings.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/DeletingTool/views/page.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/bindings/home_manager.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/home_manager.dart';
import 'package:my_house_app/app/modules/dashboard/bindings/DashBoardBindings.dart';
import 'package:my_house_app/app/modules/dashboard/views/Page.dart';
import 'package:my_house_app/app/modules/home/views/home_view.dart';
import 'package:my_house_app/app/modules/property/bindings/property_bindings.dart';
import 'package:my_house_app/app/modules/property/view/property.dart';
import 'package:my_house_app/app/modules/propertydetails/bindings/property_binding.dart';
import 'package:my_house_app/app/modules/propertydetails/views/property_view.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/bindings/register_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/mainscreen/bindings/mainbar_binding.dart';
import '../modules/mainscreen/views/Mainbar_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  MainbarView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTYDETAILS,
      page: () =>  PropertyDetails(),
      binding: PropertyDetailsBinding(),
    ),
     GetPage(
      name: _Paths.PROPERTYMANAGER,
      page: () =>  PropertyManager(),
      binding: PropertyManagerBinding(),
    ),
     GetPage(
      name: _Paths.AddingEngineer,
      page: () =>  AddingEngineer(),
      binding: AddingEngineerBinding(),
    ),
         
    

    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(name: _Paths.AUTH, page: () => AuthView(), binding: AuthBinding()),
    //Auth.Register
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
     GetPage(
      name: Routes.DashBoard,
      page: () =>  DashBoardPage(),
      binding: Dashboardbindings(),
    ),
    GetPage(
      name: Routes.DeletingTool,
      page: () =>  Deletingtool(),
      binding: DeletingToolBinding(),
    ),
  ];
}
