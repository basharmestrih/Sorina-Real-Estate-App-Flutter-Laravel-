import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';

class PropertyFeatures extends StatelessWidget {
  const PropertyFeatures({super.key});

  final List<String> features = const [
    "Classy furniture",
    "Smart system",
    "Building security",
    "Annually insurance",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
         'label_what_will_you_get'.tr,
           style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 6),
        ...features.map((feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Text(
                    feature,
                   style: Theme.of(context).textTheme.labelMedium,
                  ),
                                    const SizedBox(width: 8),
                   const Icon(Icons.check_sharp,weight:2000, color: AppColors.black, size: 30),
                ],
              ),
            )),
      ],
    );
  }
}
