import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_haven/core/app_assets.dart';
import 'package:home_haven/core/app_color.dart';
import 'package:home_haven/widgets/custom_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController =
  TextEditingController();

  final TextEditingController _lastNameController =
  TextEditingController();

  final TextEditingController _emailController =
  TextEditingController();

  final TextEditingController _passwordController =
  TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _createAccount() {
    if (_formKey.currentState!.validate()) {
      debugPrint('Create Account pressed');
    }
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
                    'Create Account',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColor.Blackbold,
                  ),

                  SizedBox(height: 5.h),

                  // Description
                  CustomText(
                    'Fill in your details below to get started on a\n'
                        'seamless shopping experience.',
                    fontSize: 14,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 27.h),

                  // First Name
                  _buildTextField(
                    controller: _firstNameController,
                    label: 'First Name',
                    hintText: 'Muhib',
                    iconPath: AppAssets.person_icon,
                  ),

                  SizedBox(height: 14.h),

                  // Last Name
                  _buildTextField(
                    controller: _lastNameController,
                    label: 'Last Name',
                    hintText: 'Khan',
                    iconPath: AppAssets.person_icon,
                  ),

                  SizedBox(height: 14.h),

                  // Email
                  _buildTextField(
                    controller: _emailController,
                    label: 'Email',
                    hintText: 'muhibgumbat00@mail.com',
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

                  SizedBox(height: 17.h),

                  // Terms
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade600,
                        height: 1.2,
                      ),
                      children: [
                        const TextSpan(
                          text:
                          'By clicking Create Account, you acknowledge you\n'
                              'have read and agreed to our ',style: TextStyle(
                          fontSize: 14
                        )
                        ),
                        TextSpan(
                          text: 'Terms of Use',
                          style: TextStyle(
                            color: AppColor.PrimryColor,
                            fontSize: 14,
                          ),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy\nPolicy',
                          style: TextStyle(
                            color: AppColor.PrimryColor,
                            fontSize: 14
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 17.h),

                  // Create Account Button
                  SizedBox(
                    width: double.infinity,
                    height: 37.h,
                    child: ElevatedButton(
                      onPressed: _createAccount,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        AppColor.PrimryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(6.r),
                        ),
                      ),
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 28.h),

                  // OR
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1.5,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: CustomText(
                          'OR',
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1.5,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 23.h),

                  // Google
                  _socialButton(
                    iconPath: AppAssets.google,
                    text: 'Continue with Google',
                    onTap: () {
                      debugPrint(
                        'Google button pressed',
                      );
                    },
                  ),

                  SizedBox(height: 14.h),

                  // Facebook
                  _socialButton(
                    iconPath: AppAssets.facebook,
                    text: 'Continue with Facebook',
                    onTap: () {
                      debugPrint(
                        'Facebook button pressed',
                      );
                    },
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

        if (label == 'Password' &&
            value.length < 6) {
          return 'Password must be at least 6 characters';
        }

        return null;
      },

      style: TextStyle(
        fontSize: 12.sp,
        color: AppColor.Blackbold,
      ),

      decoration: InputDecoration(
        prefixIcon: Padding(
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

        // Updated
        fillColor: AppColor.White,

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
            SizedBox(width: 8.w),
            Text(
              text,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.PrimryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}