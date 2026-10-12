import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_haven/core/app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: AppColor.White,

    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.PrimryColor,
       primary: AppColor.PrimryColor
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.White,
      foregroundColor: AppColor.Blackbold,
      elevation: 0,
      centerTitle: false,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.Neoutral70UO,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide.none,
      ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
    ),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: AppColor.PrimryColor,
  )
        )
    )
  );
}