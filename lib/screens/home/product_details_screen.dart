import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_haven/core/app_assets.dart';
import 'package:home_haven/core/app_color.dart';

import '../../providers/cart_provider.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
final String imagePath;
final String productName;
final String price;
final String oldPrice;
final String discount;
final String rating;
final String reviews;

const ProductDetailsScreen({
super.key,
required this.imagePath,
required this.productName,
required this.price,
required this.oldPrice,
required this.discount,
required this.rating,
required this.reviews,
});

@override
ConsumerState<ProductDetailsScreen> createState() =>
_ProductDetailsScreenState();
}

class _ProductDetailsScreenState
extends ConsumerState<ProductDetailsScreen> {

// Selected product image index
int selectedImage = 0;

// Quantity
int quantity = 1;

// Product images
// The selected product image comes from the product card.
List<String> get productImages => [
widget.imagePath,
];

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: AppColor.Homeback,

// =========================================================
// BODY
// =========================================================
body: SafeArea(
child: SingleChildScrollView(
child: Column(
children: [

// =================================================
// Main Product Image
// =================================================
SizedBox(
height: 330.h,
width: double.infinity,
child: Center(
child: Image.asset(
productImages[selectedImage],
width: 300.w,
height: 300.h,
fit: BoxFit.contain,
),
),
),

// =================================================
// Product Thumbnails
// =================================================
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: List.generate(
productImages.length,
(index) {

// Check which thumbnail is selected
final isSelected =
selectedImage == index;

return GestureDetector(
onTap: () {
setState(() {
selectedImage = index;
});
},

child: Container(
width: 48.w,
height: 48.h,
margin: EdgeInsets.symmetric(
horizontal: 6.w,
),
padding: EdgeInsets.all(3.w),

decoration: BoxDecoration(
borderRadius:
BorderRadius.circular(10.r),

// Selected image gets primary color border
border: Border.all(
color: isSelected
? AppColor.PrimryColor
    : Colors.transparent,
width: 1.5,
),

color: Colors.grey.shade100,
),

child: ClipRRect(
borderRadius:
BorderRadius.circular(7.r),

child: Image.asset(
productImages[index],
fit: BoxFit.cover,
),
),
),
);
},
),
),

SizedBox(height: 15.h),

// =================================================
// Product Details Card
// =================================================
Container(
width: double.infinity,
padding: EdgeInsets.all(15.w),

decoration: BoxDecoration(
color: AppColor.White,

borderRadius: BorderRadius.only(
topLeft: Radius.circular(18.r),
topRight: Radius.circular(18.r),
),

boxShadow: [
BoxShadow(
color: Colors.black12,
blurRadius: 8,
offset: const Offset(0, -2),
),
],
),

child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [

// =================================================
// Product Name
// =================================================
Text(
widget.productName,
style: TextStyle(
fontSize: 14.sp,
color: Colors.grey.shade600,
fontWeight: FontWeight.bold,
),
),

SizedBox(height: 5.h),

// =================================================
// Price + Old Price + Discount
// =================================================
Row(
crossAxisAlignment:
CrossAxisAlignment.center,
children: [

// Current Price
Text(
widget.price,
style: TextStyle(
fontSize: 28.sp,
fontWeight: FontWeight.w700,
color: AppColor.Blackbold,
),
),

SizedBox(width: 10.w),

// Old Price
Text(
widget.oldPrice,
style: TextStyle(
fontSize: 13.sp,
color: Colors.grey.shade600,
decoration:
TextDecoration.lineThrough,
),
),

SizedBox(width: 8.w),

// Discount
Container(
padding: EdgeInsets.symmetric(
horizontal: 7.w,
vertical: 4.h,
),

decoration: BoxDecoration(
color: Colors.redAccent,
borderRadius:
BorderRadius.circular(5.r),
),

child: Text(
widget.discount,
style: TextStyle(
fontSize: 9.sp,
color: AppColor.White,
fontWeight: FontWeight.w600,
),
),
),
],
),

SizedBox(height: 5.h),

// =================================================
// Rating
// =================================================
Row(
children: [

Icon(
Icons.star,
size: 16.sp,
color: Colors.amber,
),

SizedBox(width: 4.w),

Text(
'${widget.rating} ${widget.reviews}',
style: TextStyle(
fontSize: 13.sp,
color: Colors.grey.shade600,
),
),
],
),

SizedBox(height: 12.h),

// =================================================
// Product Description
// =================================================
Text(
'A minimalist chair with a reversible back\n'
'cushion provides soft support for your back\n'
'and has two sides to wear.',
style: TextStyle(
fontSize: 13.sp,
height: 1.4,
color: Colors.grey.shade700,
),
),

SizedBox(height: 15.h),

// Divider
Divider(
color: Colors.grey.shade300,
),

SizedBox(height: 10.h),

// =================================================
// Colors Heading
// =================================================
Text(
'Colors',
style: TextStyle(
fontSize: 17.sp,
fontWeight: FontWeight.w700,
color: AppColor.Blackbold,
),
),

SizedBox(height: 10.h),

// =================================================
// First Row - Harvest Gold + Eerie Black
// =================================================
Row(
children: [

// Harvest Gold
Container(
width: 138.w,
height: 55.h,
padding: EdgeInsets.all(6.w),

decoration: BoxDecoration(
borderRadius:
BorderRadius.circular(8.r),

border: Border.all(
color: AppColor.PrimryColor,
),
),

child: Row(
children: [

Container(
width: 30.w,
height: 30.h,

decoration: BoxDecoration(
color:
const Color(0xFFE2AA2B),
borderRadius:
BorderRadius.circular(5.r),
),
),

SizedBox(width: 8.w),

Text(
'Harvest Gold',
style: TextStyle(
fontSize: 11.sp,
color:
Colors.grey.shade700,
),
),
],
),
),

SizedBox(width: 10.w),

// Eerie Black
Container(
width: 138.w,
height: 55.h,
padding: EdgeInsets.all(6.w),

decoration: BoxDecoration(
borderRadius:
BorderRadius.circular(8.r),

border: Border.all(
color: Colors.grey.shade300,
),
),

child: Row(
children: [

Container(
width: 30.w,
height: 30.h,

decoration: BoxDecoration(
color: Colors.black,
borderRadius:
BorderRadius.circular(5.r),
),
),

SizedBox(width: 8.w),

Text(
'Eerie Black',
style: TextStyle(
fontSize: 11.sp,
color:
Colors.grey.shade700,
),
),
],
),
),
],
),

SizedBox(height: 10.h),

// =================================================
// Second Row - Flame + Pakistan Green
// =================================================
Row(
children: [

// Flame
Container(
width: 138.w,
height: 55.h,
padding: EdgeInsets.all(6.w),

decoration: BoxDecoration(
color: AppColor.White,
borderRadius:
BorderRadius.circular(8.r),

border: Border.all(
color: Colors.grey.shade300,
),
),

child: Row(
children: [

Container(
width: 30.w,
height: 30.h,

decoration: BoxDecoration(
color:
const Color(0xFFE9542F),
borderRadius:
BorderRadius.circular(5.r),
),
),

SizedBox(width: 8.w),

Text(
'Flame',
style: TextStyle(
fontSize: 11.sp,
color:
Colors.grey.shade700,
),
),
],
),
),

SizedBox(width: 10.w),

// Pakistan Green
Container(
width: 138.w,
height: 55.h,
padding: EdgeInsets.all(6.w),

decoration: BoxDecoration(
color: AppColor.White,
borderRadius:
BorderRadius.circular(8.r),

border: Border.all(
color: Colors.grey.shade300,
),
),

child: Row(
children: [

Container(
width: 30.w,
height: 30.h,

decoration: BoxDecoration(
color:
const Color(0xFF194D18),
borderRadius:
BorderRadius.circular(5.r),
),
),

SizedBox(width: 8.w),

Text(
'Pakistan Green',
style: TextStyle(
fontSize: 11.sp,
color:
Colors.grey.shade700,
),
),
],
),
),
],
),

// =================================================
// Quantity
// =================================================
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
'Quantity',
style: TextStyle(
fontSize: 17.sp,
fontWeight: FontWeight.w700,
color: AppColor.Blackbold,
),
),
Container(
height: 40.h,
decoration: BoxDecoration(
color: Colors.grey.shade100,
borderRadius: BorderRadius.circular(8.r),
),
child: Row(
children: [
IconButton(
onPressed: () {
if (quantity > 1) {
setState(() { quantity--; });
}
},
icon: Icon(Icons.remove, size: 18.sp, color: AppColor.PrimryColor),
),
Text(
'$quantity',
style: TextStyle(
fontSize: 15.sp,
fontWeight: FontWeight.w600,
color: AppColor.Blackbold,
),
),
IconButton(
onPressed: () {
setState(() { quantity++; });
},
icon: Icon(Icons.add, size: 18.sp, color: AppColor.PrimryColor),
),
],
),
),
],
),

SizedBox(height: 20.h),
],
),
),
],
),
),
),

// ===========================================================
// BOTTOM BAR
// Favorite Button + Add to Cart Button
// ===========================================================
bottomNavigationBar: SafeArea(
top: false,

child: Container(
height: 82.h,

padding: EdgeInsets.symmetric(
horizontal: 14.w,
vertical: 10.h,
),

decoration: BoxDecoration(
color: AppColor.White,

borderRadius: BorderRadius.only(
topLeft: Radius.circular(15.r),
topRight: Radius.circular(15.r),
),

boxShadow: [
BoxShadow(
color: Colors.black12,
blurRadius: 8,
offset: const Offset(0, -2),
),
],
),

child: Row(
children: [

// =================================================
// Favorite Button
// =================================================
Container(
width: 40.w,
height: 40.h,

decoration: BoxDecoration(
color: AppColor.White,
borderRadius:
BorderRadius.circular(7.r),

border: Border.all(
color: AppColor.PrimryColor,
width: 1,
),
),

child: IconButton(
padding: EdgeInsets.zero,

onPressed: () {
ref
    .read(cartProvider.notifier)
    .toggleFavoriteByName(widget.productName);
},

icon: Icon(
ref
    .watch(cartProvider.notifier)
    .isFavorite(widget.productName)
? Icons.favorite
    : Icons.favorite_border,
size: 21.sp,
color: AppColor.PrimryColor,
),
),
),

SizedBox(width: 12.w),

// =================================================
// Add to Cart Button
// =================================================
Expanded(
child: SizedBox(
height: 40.h,

child: ElevatedButton(
onPressed: () {
ref.read(cartProvider.notifier).addToCart(
CartItem(
image: widget.imagePath,
name: widget.productName,
price: widget.price,
oldPrice: widget.oldPrice,
color: 'Yellow',
discount: widget.discount,
quantity: quantity,
),
);

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text('Product added to cart'),
),
);
},

style: ElevatedButton.styleFrom(
backgroundColor:
AppColor.PrimryColor,

foregroundColor:
AppColor.White,

elevation: 0,

shape: RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(7.r),
),
),

child: Text(
'Add to Cart',
style: TextStyle(
fontSize: 13.sp,
fontWeight: FontWeight.w600,
),
),
),
),
),
],
),
),
),
);
}
}
