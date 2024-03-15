import 'package:finance_app_firebase/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.tealPrimary,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
      elevation: 5.0),
  appBarTheme: const AppBarTheme(
      color: AppColors.backgroundColor, foregroundColor: AppColors.white),
  textTheme: GoogleFonts.kanitTextTheme().apply(
    bodyColor: AppColors.white,
  ),
);
