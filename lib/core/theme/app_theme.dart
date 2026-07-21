import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.transparent, // Background will be handled by AuroraBackground
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.sora(color: AppColors.textHeading, fontWeight: FontWeight.w700, fontSize: 72, letterSpacing: -2),
        displayMedium: GoogleFonts.spaceGrotesk(color: AppColors.textHeading, fontWeight: FontWeight.w700, fontSize: 42),
        bodyLarge: GoogleFonts.inter(color: AppColors.textBody, fontWeight: FontWeight.w400, fontSize: 18),
        bodyMedium: GoogleFonts.inter(color: AppColors.textBody, fontWeight: FontWeight.w400, fontSize: 16),
        titleLarge: GoogleFonts.spaceGrotesk(color: AppColors.textHeading, fontWeight: FontWeight.w700, fontSize: 24),
        titleMedium: GoogleFonts.inter(color: AppColors.textHeading, fontWeight: FontWeight.w600, fontSize: 18),
        labelLarge: GoogleFonts.inter(color: AppColors.textHeading, fontWeight: FontWeight.w600, fontSize: 17),
      ),
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
