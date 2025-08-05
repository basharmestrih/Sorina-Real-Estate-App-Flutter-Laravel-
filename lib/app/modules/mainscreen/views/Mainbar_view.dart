   import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/modules/architects/views/architects_view.dart';
import 'package:my_house_app/app/modules/askforad/bindings/AskForAdBinding.dart';
import 'package:my_house_app/app/modules/askforad/views/page.dart';
import 'package:my_house_app/app/modules/home/views/home_view.dart';
import 'package:my_house_app/app/modules/mainscreen/views/widgets/SideMenu.dart';
import 'package:my_house_app/app/modules/mainscreen/views/widgets/bottombar.dart' show BottomNavBar;
import 'package:my_house_app/app/modules/property/controllers/propertycontroller.dart';
import 'package:my_house_app/app/modules/property/view/property.dart';
import '../controllers/mainbar_controller.dart';
import 'widgets/Appbar.dart';

class MainbarView extends StatefulWidget {
  const MainbarView({super.key});

  @override
  State<MainbarView> createState() => _HomePageState();
}

class _HomePageState extends State<MainbarView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void toggleLanguage() {
    // Your language switch logic here
    print("Language toggled");
  }
  
  final MainbarController controller = Get.find();


  final List<Widget> bodies = [
    HomeView(),
    PropertyView(),
    AskForAdPage(),
    ArchitectsView(),
    
   
    //ProfileView(),
  ];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,

      appBar: CustomAppBar(
        onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      drawer: SideMenu(onToggleLanguage: toggleLanguage),
      body: Obx(() => bodies[controller.selectedIndex.value]),
            bottomNavigationBar: BottomNavBar(),

    
      );
    
  }
}
