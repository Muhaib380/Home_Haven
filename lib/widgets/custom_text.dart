import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? height;
  final TextDecoration? decoration;
  final String? fontFamily;

  const CustomText(
      this.text, {
        super.key,
        this.fontSize = 14,
        this.fontWeight = FontWeight.normal,
        this.color = Colors.black,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.letterSpacing,
        this.height,
        this.decoration,
        this.fontFamily,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontFamily: fontFamily,
      ),
    );
  }
}