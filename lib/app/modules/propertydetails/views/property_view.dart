


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/core/theme/colors2.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Appbar.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/PropertyFeatures.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/PropertyGallery.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/PropertyStatistics.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/mainRow.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/secondaryRow.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
     body: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const PropertyGallery(),
           Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 16),
            TitlePriceRow(title: "Luxury Villa", price: "\$1,250,000"),
            SizedBox(height: 16),
            DescriptionRow(
              description:
                  "This is a beautiful villa located in a prime area with 5 bedrooms, 4 bathrooms, and a private pool. Perfect for a modern family.",
            ),
            SizedBox(height: 5),
            PropertyFeatures(),
            SizedBox(height: 16),
            Propertystatistics(),
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
                    child: const Text( 'Chat on Whatsapp',),
                  ),
      ),
    
    );
  }
}
