import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Appbar.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Location_Address_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/PropertySituation_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Property_Features_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Property_Display_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Property_Statistics_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Naming_Cost_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Property_Description_widget.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});
  

  @override
  Widget build(BuildContext context) {
  final args = Get.arguments as Map<String, dynamic>;

  final String imgUrl = args['imgUrl'] ?? '';
  final String location = args['location'] ?? '';
  final String address = args['address'] ?? '';
  final String title = args['title'] ?? '';
  final String price = args['price'] ?? '';
  final String description = args['description'] ?? '';
  final int roomsNumber = args['roomsNumber'] ?? 0;
  final int bathsNumber = args['bathsNumber'] ?? 0;
  final int floorsNumber = args['floorsNumber'] ?? 0;
  final int groundDistance = args['groundDistance'] ?? 0;
  final int buildingAge = args['buildingAge'] ?? 0;
  final bool isSell = args['isSell'];
   final bool isRent = args['isRent'];
    final bool isFurnitured = args['isFurnitured'];

  final List<String> mainFeatures = List<String>.from(args['mainFeatures'] ?? []);


    return Scaffold(
      appBar: const CustomAppBar(),
     body: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            PropertyGallery(imageUrl:imgUrl),
           Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            SizedBox(height: 16.h),
            TitlePriceRow(title: title, price: price),
            SizedBox(height: 16.h),
            DescriptionRow(
              description: description,
            ),
            SizedBox(height: 20.h),
            PropertySituation(isSell: isSell, isRent: isRent, isFurnitured: isFurnitured),
            SizedBox(height: 20.h),
            LocationAddressWidget(location:location, address:address),
            SizedBox(height: 20.h),
            PropertyFeatures(features: mainFeatures),

            SizedBox(height: 16.h),
            Propertystatistics(
            roomsNumber: roomsNumber,
            bathsNumber: bathsNumber,
            floorsNumber: floorsNumber,
            groundDistance: groundDistance,
            buildingAge: buildingAge,
          ),

          ],
        ),
           ),
         ],
       ),
     ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ResponsiveButton(
                    onPressed: () {
                    },
                    clickable: true,
                    buttonStyle:  ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                      ),
                    ),
                    buttonWidth: Get.width/2,
                    child:  Text( 'buttons_chat_on_whatsapp'.tr),
                  ),
      ), 
    );
  }
}
