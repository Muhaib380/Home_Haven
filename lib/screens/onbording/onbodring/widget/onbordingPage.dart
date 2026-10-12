import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_color.dart';


class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70.r),
            bottomRight: Radius.circular(70.r),
          ),
          child: Image.asset(
            image,
            width: double.infinity,
            height: 440.h,
            fit: BoxFit.cover,
          ),
        ),

        SizedBox(height: 22.h),

        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.Blackbold,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              height: 1.15,
            ),
          ),
        ),

        SizedBox(height: 8.h),

        // Description
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.Neoutral70UO,
              fontSize: 15.5.sp,
              fontWeight: FontWeight.w400,
              height: 1.35,
            ),
          ),
        ),
      ],
    );
  }
}