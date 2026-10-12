import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_haven/core/app_assets.dart';
import 'package:home_haven/core/app_color.dart';
import 'package:home_haven/widgets/custom_text.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 2),(){
      if(mounted){
        context.go("/onboarding");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.PrimryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: Image.asset(
            AppAssets.logo,
            width: 87.w,height: 87.h,
          ),
        ),
        SizedBox(height: 16,),
         Center(
           child: CustomText("HomeHaven",
           fontSize: 36,fontWeight: FontWeight.bold,
             color: AppColor.White,
           ),
         )

      ],),
    );
  }
}
