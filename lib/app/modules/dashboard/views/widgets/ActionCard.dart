import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_house_app/app/core/theme/colors.dart';

class ActionCard extends StatelessWidget {
  final String pagename;
  final VoidCallback? onTap;

  const ActionCard({Key? key, required this.pagename, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      
      color: AppColors.secondary,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Center(
          child: Text(
            pagename,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
