import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_haven/core/app_assets.dart';

import '../../core/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

int _currentIndex = 0;

@override
Widget build(BuildContext context) {

return Scaffold(
backgroundColor: AppColor.Homeback,

body: SafeArea(
child: SingleChildScrollView(
child: Padding(
padding: EdgeInsets.symmetric(horizontal: 14.w),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

SizedBox(height: 13.h),

// Search + Notification
Row(
children: [

// Search bar
Expanded(
child: Container(
height: 40.h,
decoration: BoxDecoration(
color: AppColor.White,
borderRadius: BorderRadius.circular(22.r),
border: Border.all(
color: Colors.grey.shade300,
),
),
child: Row(
children: [

SizedBox(width: 12.w),

Icon(
Icons.search,
size: 21.sp,
color: Colors.black,
),

SizedBox(width: 8.w),

Expanded(
child: Text(
'Search candles',
style: TextStyle(
fontSize: 12.sp,
color: Colors.grey,
),
),
),

Icon(
Icons.camera_alt_outlined,
size: 18.sp,
color: Colors.black87,
),

SizedBox(width: 12.w),
],
),
),
),

SizedBox(width: 12.w),

// Notification
Icon(
Icons.notifications_none_outlined,
size: 25.sp,
color: Colors.black87,
),
],
),

SizedBox(height: 14.h),

// Delivery Location
Row(
children: [

Icon(
Icons.location_on_outlined,
size: 19.sp,
color: Colors.black87,
),

SizedBox(width: 7.w),

Text(
'Deliver to',
style: TextStyle(
fontSize: 12.sp,
color: Colors.grey.shade700,
),
),

SizedBox(width: 8.w),

Expanded(
child: Text(
'3517 W. Gray St. Utica, Pennsylvania',
maxLines: 1,
overflow: TextOverflow.ellipsis,
style: TextStyle(
fontSize: 12.sp,
fontWeight: FontWeight.w600,
color: Colors.black87,
),
),
),

Icon(
Icons.keyboard_arrow_down,
size: 20.sp,
),
],
),

SizedBox(height: 21.h),

// Promotional Banner
ClipRRect(
borderRadius: BorderRadius.circular(10.r),
child: Image.asset(
AppAssets.home_banner,
width: double.infinity,
height: 170.h,
fit: BoxFit.cover,
),
),

SizedBox(height: 12.h),

// Banner Dots
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Container(
width: 7.w,
height: 7.h,
decoration: BoxDecoration(
color: AppColor.PrimryColor,
shape: BoxShape.circle,
),
),

SizedBox(width: 8.w),

Container(
width: 7.w,
height: 7.h,
decoration: BoxDecoration(
color: Colors.grey.shade300,
shape: BoxShape.circle,
),
),

SizedBox(width: 8.w),

Container(
width: 7.w,
height: 7.h,
decoration: BoxDecoration(
color: Colors.grey.shade300,
shape: BoxShape.circle,
),
),
],
),
SizedBox(height: 24.h),

// Special Offers Header
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Text(
'Special Offers',
style: TextStyle(
fontSize: 22.sp,
fontWeight: FontWeight.w700,
color: AppColor.Blackbold,
),
),

Text(
'See More',
style: TextStyle(
fontSize: 12.sp,
fontWeight: FontWeight.w600,
color: AppColor.PrimryColor,
),
),
],
),

SizedBox(height: 14.h),
// Special Offers Products
SizedBox(
height: 245.h,
child: ListView(
scrollDirection: Axis.horizontal,
padding: EdgeInsets.symmetric(vertical: 5.h),
physics: const BouncingScrollPhysics(),
children: [
_productCard(

imagePath: AppAssets.chair,
discount: '45% OFF',
productName: 'EKERÖ',
price: '\$230.00',
oldPrice: '\$512.58',
rating: '4.9',
reviews: '(256)',
),

SizedBox(width: 14.w),

_productCard(
imagePath: AppAssets.blackchair,
discount: '45% OFF',
productName: 'STRANDMON',
price: '\$274.13',
oldPrice: '\$856.60',
rating: '4.8',
reviews: '(128)',
),

SizedBox(width: 14.w),

_productCard(
imagePath: AppAssets.chair,
discount: '30% OFF',
productName: 'POÄNG',
price: '\$180.00',
oldPrice: '\$250.00',
rating: '4.7',
reviews: '(96)',
),
],
),
),


],
),
),
),
),



// Bottom Navigation
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
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [

_bottomNavItem(
icon: Icons.home_outlined,
title: 'Home',
index: 0,
route: '/home',
),

_bottomNavItem(
icon: Icons.shopping_cart_outlined,
title: 'Cart',
index: 1,
route: '/my-cart',
),

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

Widget _productCard({
required String imagePath,
required String discount,
required String productName,
required String price,
required String oldPrice,
required String rating,
required String reviews,
}) {
return GestureDetector(
  onTap: () {
    context.push(
      '/product_details',
      extra: {
        'imagePath': imagePath,
        'productName': productName,
        'price': price,
        'oldPrice': oldPrice,
        'discount': discount,
        'rating': rating,
        'reviews': reviews,
      },
    );
  },
child: Container(
width: 145.w,
height: 235.h,
padding: EdgeInsets.all(10.w),
decoration: BoxDecoration(
color: AppColor.White,
borderRadius: BorderRadius.circular(12.r),
boxShadow: [
BoxShadow(
color: Colors.black12,
blurRadius: 8,
offset: const Offset(0, 2),
),
],
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

// Product Image
SizedBox(
height: 115.h,
width: double.infinity,
child: Stack(
children: [

Center(
child: Image.asset(
imagePath,
width: 110.w,
height: 105.h,
fit: BoxFit.contain,
),
),

// Discount Badge
Positioned(
left: 0,
bottom: 0,
child: Container(
padding: EdgeInsets.symmetric(
horizontal: 5.w,
vertical: 3.h,
),
decoration: BoxDecoration(
color: Colors.redAccent,
borderRadius: BorderRadius.circular(4.r),
),
child: Text(
discount,
style: TextStyle(
fontSize: 9.sp,
fontWeight: FontWeight.w600,
color: Colors.white,
),
),
),
),
],
),
),

SizedBox(height: 5.h),

// Product Name
Text(
productName,
maxLines: 1,
overflow: TextOverflow.ellipsis,
style: TextStyle(
fontSize: 13.sp,
color: Colors.grey.shade600,
),
),

SizedBox(height: 2.h),

// Price
Text(
price,
style: TextStyle(
fontSize: 18.sp,
fontWeight: FontWeight.w700,
color: AppColor.Blackbold,
),
),

// Old Price
Text(
oldPrice,
style: TextStyle(
fontSize: 9.sp,
color: Colors.grey.shade500,
decoration: TextDecoration.lineThrough,
),
),

SizedBox(height: 3.h),

// Rating
Row(
children: [
Icon(
Icons.star,
size: 15.sp,
color: Colors.amber,
),

SizedBox(width: 3.w),

Text(
rating,
style: TextStyle(
fontSize: 10.sp,
color: Colors.grey.shade700,
),
),

SizedBox(width: 3.w),

Text(
reviews,
style: TextStyle(
fontSize: 10.sp,
color: Colors.grey.shade600,
),
),
],
),
],
),
),
);
}
Widget _bottomNavItem({
required IconData icon,
required String title,
required int index,
required String route,
}) {
final bool isSelected = _currentIndex == index;

return GestureDetector(
onTap: () {
// Update selected bottom navigation item
setState(() {
_currentIndex = index;
});

// Navigate to selected screen
context.go(route);
},

child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [

// =================================================
// Navigation Icon
// =================================================

Icon(
icon,
size: 23.sp,
color: isSelected
? AppColor.PrimryColor
: Colors.grey.shade400,
),

SizedBox(height: 4.h),

// =================================================
// Navigation Title
// =================================================

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
);}
}
