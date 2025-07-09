import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/core/theme/colors2.dart';
import 'package:my_house_app/app/routes/app_pages.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';

//new edits
class PropertyCard extends StatelessWidget {
  final String imageUrl;
  final String location;
   final String address;
  final String name;
  final String price;

  const PropertyCard({
    required this.imageUrl,
    required this.location,
    required this.address,
    required this.name,
    required this.price,
  });

 @override
Widget build(BuildContext context) {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🖼️ Image with Favorite Icon
        Stack(
          children: [
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 12,
              right: 4,
              child: Container(
                height: 40,
                width: 70,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.bookmark,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ],
        ),

        // 📝 Info Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 📍 Location + Price Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 25, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            location,
                           style: Theme.of(context).textTheme.labelMedium
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                     Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                address,
                                style: Theme.of(context).textTheme.labelSmall
                              
                              ),
                              SizedBox(height: 3,),
                               Text(
                                '4 Rooms, 3 Kitchens, Deluxe Design',
                                style: Theme.of(context).textTheme.labelSmall
                              
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        price,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        '/Paid in Usd',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
               
                    style: Theme.of(context).textTheme.titleLarge,
                    
                  ),

                   ResponsiveButton(
                    buttonHeight:Get.height/20,
                    onPressed: () {
                       Get.toNamed(Routes.PROPERTYDETAILS);
                      
                    },
                    clickable: true,

                    
                    buttonWidth: Get.width/3,
                    child: Text( 'Contact Seller', style: Theme.of(context).textTheme.titleSmall,),
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}