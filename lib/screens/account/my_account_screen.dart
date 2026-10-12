

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_assets.dart';
import '../../core/app_color.dart';

class MyAccountScreen extends StatefulWidget {
const MyAccountScreen({super.key});

@override
State<MyAccountScreen> createState() =>
_MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {

// =================================================
// Bottom Navigation Current Index
// =================================================

int _currentIndex = 2;

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: AppColor.Homeback,

body: SafeArea(
child: SingleChildScrollView(
child: Column(
children: [

// =================================================
// Green Header
// =================================================

Container(
width: double.infinity,
height: 115.h,

decoration: BoxDecoration(
color: AppColor.PrimryColor,
),

child: Padding(
padding: EdgeInsets.symmetric(
horizontal: 14.w,
vertical: 12.h,
),

child: Row(
mainAxisAlignment:
MainAxisAlignment.spaceBetween,

crossAxisAlignment:
CrossAxisAlignment.start,

children: [

// My Account Title
Text(
'My Account',
style: TextStyle(
fontSize: 20.sp,
fontWeight: FontWeight.w600,
color: AppColor.White,
),
),

// Notification Icon
Icon(
Icons.notifications_none_outlined,
size: 27.sp,
color: AppColor.White,
),
],
),
),
),

// =================================================
// Profile Card
// =================================================

Transform.translate(
offset: Offset(0, -35.h),

child: Container(
width: double.infinity,

margin: EdgeInsets.symmetric(
horizontal: 14.w,
),

padding: EdgeInsets.symmetric(
horizontal: 12.w,
vertical: 13.h,
),

decoration: BoxDecoration(
color: AppColor.White,

borderRadius:
BorderRadius.circular(12.r),

boxShadow: [
BoxShadow(
color: Colors.black12,
blurRadius: 8,
offset: const Offset(0, 2),
),
],
),

child: Row(
children: [

// =================================================
// Profile Image
// =================================================

Container(
width: 48.w,
height: 48.h,

decoration: const BoxDecoration(
shape: BoxShape.circle,
color: Colors.grey,
),

child: ClipOval(
child: Image.asset(
AppAssets.profile,
fit: BoxFit.cover,
),
),
),

SizedBox(width: 12.w),

// =================================================
// Name + Email
// =================================================

Expanded(
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,

children: [

Text(
'Claire Cooper',
style: TextStyle(
fontSize: 16.sp,
fontWeight: FontWeight.w600,
color:
AppColor.Blackbold,
),
),

SizedBox(height: 3.h),

Text(
'claire.cooper@mail.com',
style: TextStyle(
fontSize: 12.sp,
color:
Colors.grey.shade500,
),
),
],
),
),

// =================================================
// Edit Icon
// =================================================

Icon(
Icons.edit_outlined,
size: 24.sp,
color: Colors.grey.shade700,
),
],
),
),
),

// =================================================
// General Heading
// =================================================

Align(
alignment: Alignment.centerLeft,

child: Padding(
padding: EdgeInsets.symmetric(
horizontal: 14.w,
),

child: Text(
'General',
style: TextStyle(
fontSize: 13.sp,
fontWeight: FontWeight.w600,
color: AppColor.Blackbold,
),
),
),
),

SizedBox(height: 10.h),

// =================================================
// Transaction
// =================================================

_accountOption(
icon: Icons.receipt_long_outlined,
title: 'Transaction',
),

// =================================================
// Wishlist
// =================================================

_accountOption(
icon: Icons.favorite_border,
title: 'Wishlist',
),

// =================================================
// Saved Address
// =================================================

_accountOption(
icon: Icons.bookmark_border,
title: 'Saved Address',
),

// =================================================
// Payment Methods
// =================================================

_accountOption(
icon: Icons.credit_card_outlined,
title: 'Payment Methods',
),

// =================================================
// Notification
// =================================================

_accountOption(
icon: Icons.notifications_none_outlined,
title: 'Notification',
),

// =================================================
// Security
// =================================================

_accountOption(
icon: Icons.lock_outline,
title: 'Security',
),

SizedBox(height: 10.h),

// =================================================
// Help Heading
// =================================================

Align(
alignment: Alignment.centerLeft,

child: Padding(
padding: EdgeInsets.symmetric(
horizontal: 14.w,
),

child: Text(
'Help',
style: TextStyle(
fontSize: 13.sp,
fontWeight: FontWeight.w600,
color: AppColor.Blackbold,
),
),
),
),

SizedBox(height: 20.h),
],
),
),
),

// =================================================
// Bottom Navigation
// =================================================

bottomNavigationBar: Container(
height: 75.h,

decoration: BoxDecoration(
color: AppColor.White,

borderRadius: BorderRadius.only(
topLeft: Radius.circular(15.r),
topRight: Radius.circular(15.r),
),

boxShadow: [
BoxShadow(
color: Colors.black12,
blurRadius: 10,
offset: const Offset(0, -2),
),
],
),

child: Row(
mainAxisAlignment:
MainAxisAlignment.spaceAround,

children: [

// =================================================
// Home
// =================================================

_bottomNavItem(
icon: Icons.home_outlined,
title: 'Home',
index: 0,
route: '/home',
),

// =================================================
// My Cart
// =================================================

_bottomNavItem(
icon: Icons.shopping_cart_outlined,
title: 'My Cart',
index: 1,
route: '/my-cart',
),

// =================================================
// My Account
// =================================================

_bottomNavItem(
icon: Icons.person_outline,
title: 'My Account',
index: 2,
route: '/my-account',
),
],
),
),
);
}

// =================================================
// Reusable Account Option
// =================================================

Widget _accountOption({
required IconData icon,
required String title,
}) {
return Container(
height: 50.h,

margin: EdgeInsets.symmetric(
horizontal: 14.w,
vertical: 9.h,
),

padding: EdgeInsets.symmetric(
horizontal: 13.w,
),

decoration: BoxDecoration(
color: AppColor.White,

borderRadius:
BorderRadius.circular(11.r),

boxShadow: [
BoxShadow(
color: Colors.black12,
blurRadius: 6,
offset: const Offset(0, 2),
),
],
),

child: Row(
children: [

// Left Icon
Icon(
icon,
size: 21.sp,
color: Colors.grey.shade700,
),

SizedBox(width: 13.w),

// Title
Expanded(
child: Text(
title,
style: TextStyle(
fontSize: 14.sp,
color: Colors.grey.shade700,
),
),
),

// Right Arrow
Icon(
Icons.chevron_right,
size: 23.sp,
color: Colors.grey.shade700,
),
],
),
);
}

// =================================================
// Bottom Navigation Item
// =================================================

Widget _bottomNavItem({
required IconData icon,
required String title,
required int index,
required String route,
}) {
final bool isSelected =
_currentIndex == index;

return GestureDetector(
onTap: () {

setState(() {
_currentIndex = index;
});

// Navigate to selected screen
context.go(route);
},

child: Column(
mainAxisAlignment:
MainAxisAlignment.center,

children: [

// Icon
Icon(
icon,
size: 23.sp,

color: isSelected
? AppColor.PrimryColor
    : Colors.grey.shade400,
),

SizedBox(height: 4.h),

// Title
Text(
title,
style: TextStyle(
fontSize: 11.sp,

fontWeight: isSelected
? FontWeight.w600
    : FontWeight.normal,

color: isSelected
? AppColor.PrimryColor
    : Colors.grey.shade400,
),
),
],
),
);
}
}
