import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_house_app/app/core/theme/colors.dart';

class LocationAddressWidget extends StatelessWidget {
  final String location;
  final String address;

  const LocationAddressWidget({super.key, required this.location, required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, size:30, color: AppColors.red,),
        Text(location,
             style: Theme.of(context).textTheme.titleLarge,
            ),
        Text(' - ',style: Theme.of(context).textTheme.titleLarge),
        Text(address,
             style: Theme.of(context).textTheme.labelMedium,),
      ],
    );
  }
}
