import 'package:flutter/material.dart';
import 'package:app1/core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {

  static TextStyle h1Display = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 32,
    color: AppColors.textPrimary
  );

  static TextStyle h2Heading = GoogleFonts.roboto(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      color: AppColors.textPrimary
  );

  static TextStyle h3Subheading = GoogleFonts.roboto(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: AppColors.textPrimary
  );

  static TextStyle bodyRegular = GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: AppColors.textSecondary
  );

  static TextStyle bodyMedium = GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: AppColors.textPrimary
  );

  static TextStyle smallRegular = GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColors.textSecondary
  );

  static TextStyle caption = GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: AppColors.textPrimary
  );
}