import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_haven/core/app_assets.dart';
import 'package:home_haven/core/app_color.dart';

import '../../providers/cart_provider.dart';

class MyCartScreen extends ConsumerStatefulWidget {
  const MyCartScreen({super.key});

  @override
  ConsumerState<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends ConsumerState<MyCartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Homeback,

      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),

              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  // My Cart Title
                  Text(
                    'My Cart',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.Blackbold,
                    ),
                  ),

                  Icon(
                    Icons.notifications_none_outlined,
                    size: 27.sp,
                    color: AppColor.Blackbold,
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 5.h,
                ),

                itemCount: ref.watch(cartProvider).length,

                itemBuilder: (context, index) {

                  final product = ref.watch(cartProvider)[index];

                  return _cartProductCard(
                    index: index,
                    image: product.image,
                    name: product.name,
                    price: product.price,
                    oldPrice: product.oldPrice,
                    colorName: product.color,
                    discount: product.discount,
                    quantity: product.quantity,
                    isFavorite: product.isFavorite,
                  );
                },
              ),
            ),
          ],
        ),
      ),


      bottomNavigationBar: SafeArea(
        top: false,

        child: Container(
          height: 88.h,

          decoration: BoxDecoration(
            color: AppColor.White,

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              _bottomNavItem(
                icon: Icons.home_outlined,
                title: 'Home',
                isSelected: false,
                route: '/home',
              ),


              _bottomNavItem(
                icon: Icons.shopping_cart_outlined,
                title: 'My Cart',
                isSelected: true,
                route: '/cart',
              ),

              _bottomNavItem(
                icon: Icons.person_outline,
                title: 'My Account',
                isSelected: false,
                route: '/home',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cartProductCard({
    required int index,
    required String image,
    required String name,
    required String price,
    required String oldPrice,
    required String colorName,
    required String discount,
    required int quantity,
    required bool isFavorite,
  }) {
    return Container(
      height: 145.h,

      margin: EdgeInsets.only(
        bottom: 14.h,
      ),

      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),

      decoration: BoxDecoration(
        color: AppColor.White,

        borderRadius: BorderRadius.circular(13.r),

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
          SizedBox(
            width: 95.w,
            height: 120.h,

            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(width: 12.w),


          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                // Product Name
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.grey.shade700,
                  ),
                ),

                SizedBox(height: 2.h),

                // Product Price
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.Blackbold,
                  ),
                ),

                SizedBox(height: 1.h),

                // Old Price + Discount
                Row(
                  children: [

                    Text(
                      oldPrice,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                        decoration:
                        TextDecoration.lineThrough,
                      ),
                    ),

                    SizedBox(width: 7.w),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 3.h,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius:
                        BorderRadius.circular(4.r),
                      ),

                      child: Text(
                        discount,
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: AppColor.White,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 4.h),

                // Product Color
                Text(
                  colorName,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.grey.shade500,
                  ),
                ),

                const Spacer(),

                // Favorite + Quantity
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    // Favorite Icon
                    GestureDetector(
                    onTap: () {
          ref
              .read(cartProvider.notifier)
              .toggleFavorite(index);
          },
            child: Icon(
              isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              size: 22.sp,
              color: isFavorite
                  ? Colors.red
                  : Colors.grey.shade500,
            ),
          ),

                    // Quantity Selector
                    Container(
                      width: 90.w,
                      height: 28.h,

                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(7.r),

                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),

                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,

                        children: [

                          // Minus
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(cartProvider.notifier)
                                  .decreaseQuantity(index);
                            },
                            child: Icon(
                              Icons.remove,
                              size: 18.sp,
                              color: AppColor.PrimryColor,
                            ),
                          ),

                          // Quantity
                          Text(
                            quantity.toString(),
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          // Plus
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(cartProvider.notifier)
                                  .increaseQuantity(index);
                            },
                            child: Icon(
                              Icons.add,
                              size: 18.sp,
                              color: AppColor.PrimryColor,
                            ),
                          ),
                        ],
                      ),
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

  // =========================================================
  // Bottom Navigation Item
  // =========================================================

  Widget _bottomNavItem({
    required IconData icon,
    required String title,
    required bool isSelected,
    required String route,
  }) {
    return GestureDetector(
      onTap: (){
        context.go(route);
      },
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
      
        children: [
      
          Icon(
            icon,
            size: 24.sp,
      
            color: isSelected
                ? AppColor.PrimryColor
                : Colors.grey.shade400,
          ),
      
          SizedBox(height: 4.h),
      
          Text(
            title,
            style: TextStyle(
              fontSize: 11.sp,
      
              fontWeight: isSelected
                  ? FontWeight.w600
                  : FontWeight.w400,
      
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