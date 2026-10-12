import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_haven/core/app_string.dart';
import 'package:home_haven/screens/onbording/onbodring/widget/onbordingPage.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_color.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': AppAssets.onbording1,
      'title': AppStrings.onboardingTitle1,
      'description':
      'Discover all style and budgets of\nfurniture, appliances, kitchen, and more\nfrom 500+ brands in your hand.',
    },
    {
      'image': AppAssets.onbording2,
      'title': AppStrings.onboardingTitle2,
      'description':
      'Sit back, and enjoy the convenience of\nour drivers delivering your order to your\ndoorstep.',
    },
    {
      'image': AppAssets.onbording3,
      'title': AppStrings.onboardingTitle3,
      'description':
      "If our products don't meet your\nexpectations, we're available 24/7 to\nassist you.",
    },
  ];

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/login');
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Onboarding pages
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];

                  return OnboardingPage(
                    image: page['image']!,
                    title: page['title']!,
                    description: page['description']!,
                  );
                },
              ),
            ),

            // Page indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                    (index) {
                  final bool isActive = _currentPage == index;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    width: isActive ? 6.w : 6.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive
                          ? AppColor.PrimryColor
                          : const Color(0xFFD9D9D9),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 18.h),

            // Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  // Back button
                  if (_currentPage != 0)
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: _previousPage,
                        child: Text(
                          'Back',
                          style: TextStyle(
                            color: AppColor.PrimryColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                  if (_currentPage != 0) SizedBox(width: 10.w),

                  // Next button
                  Expanded(
                    flex: _currentPage == 0 ? 1 : 2,
                    child: SizedBox(
                      height: 36.h,
                      child: ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.PrimryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 18.h),
          ],
        ),
      ),
    );
  }
}