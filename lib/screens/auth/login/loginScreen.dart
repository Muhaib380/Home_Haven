import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_haven/core/app_assets.dart';

import '../../../../core/app_color.dart';
import '../../../../widgets/custom_text.dart';
import '../../../core/app_color.dart';
import '../../../widgets/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController =
  TextEditingController();

  final TextEditingController _passwordController =
  TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _login() {
    context.go('/home');
    // if (_formKey.currentState!.validate()) {
    //   // Firebase/API authentication baad mein yahan add hogi.
    //   debugPrint('Login button pressed');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 55.h),

                  // Heading
                  CustomText(
                    'Welcome Back!',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColor.Blackbold,
                  ),

                  SizedBox(height: 5.h),

                  // Description
                  CustomText(
                    'Enter your email to start shopping and get\nawesome deals today!',
                    fontSize: 14,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 27.h),

                  // Email
                  _buildTextField(
                    controller: _emailController,
                    label: 'Email',
                    hintText: 'mohibgumbat00@mail.com',
                    iconPath: AppAssets.mail_icon,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  SizedBox(height: 14.h),

                  // Password
                  _buildTextField(
                    controller: _passwordController,
                    label: 'Password',
                    hintText: '**********',
                    iconPath: AppAssets.password_icon,
                    obscureText: !_isPasswordVisible,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible =
                          !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.grey,
                        size: 20.sp,
                      ),
                    ),
                  ),

                  SizedBox(height: 11.h),

                  // Forgot password
                  GestureDetector(
                    onTap: () {
                      // Forgot password later
                    },
                    child: CustomText(
                      'Forgot your password?',
                      fontSize: 14,
                      color: AppColor.PrimryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 14.h),

                  // Login button
                  SizedBox(
                    width: double.infinity,
                    height: 37.h,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.PrimryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(6.r),
                        ),
                      ),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 28.h),

                  // OR divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10.w),
                        child: CustomText(
                          'OR',
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 23.h),

                  // Google
                  _socialButton(
                    iconPath: AppAssets.google,
                    text: 'Log in with Google',
                    onTap: () {
                      // Google authentication later
                    },
                  ),

                  SizedBox(height: 14.h),

                  // Facebook
                  _socialButton(
                    iconPath: AppAssets.facebook,
                    text: 'Log in with Facebook',
                    onTap: () {
                      // Facebook authentication later
                    },
                  ),

                  SizedBox(height: 26.h),

                  // Register
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          "Don't have an account? ",
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.push('/register');
                          },
                          child: CustomText(
                            'Register',
                            fontSize: 14,
                            color: AppColor.PrimryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required String iconPath,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,

      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '$label is required';
        }

        if (label == 'Email' &&
            !value.contains('@')) {
          return 'Enter a valid email';
        }

        return null;
      },

      style: TextStyle(
        fontSize: 12.sp,
        color: AppColor.Blackbold,
      ),

      decoration: InputDecoration(
        prefixIcon:  Padding(
          padding: EdgeInsets.all(12.w),
          child: Image.asset(
            iconPath,
            width: 18.w,
            height: 18.h,
          ),
        ),

        suffixIcon: suffixIcon,

        labelText: label,
        labelStyle: TextStyle(
          fontSize: 12.sp,
          color: Colors.grey.shade600,
        ),

        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 12.sp,
          color: Colors.grey.shade700,
        ),

        filled: true,
        fillColor: Colors.white,

        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 10.h,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.r),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.r),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.r),
          borderSide: BorderSide(
            color: AppColor.PrimryColor,
          ),
        ),
      ),
    );
  }

  Widget _socialButton({
    required String iconPath,
    required String text,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 36.h,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: AppColor.PrimryColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 18.w,
              height: 18.h,
            ),
            SizedBox(width: 8.w,),
            Text(
              text,
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.PrimryColor
              ),
            ),

          ],
        ),
      ),
    );
  }
}