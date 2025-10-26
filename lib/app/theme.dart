import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFFF6E8B1); // amarillo suave de tus pantallas
  static const accent  = Color(0xFFFF6B3D); // naranja botones
  static const dark    = Color(0xFF121212);
  static const text    = Color(0xFF222222);
  static const grey    = Color(0xFF9E9E9E);
  static const bg      = Color(0xFFF7F7F7);
}

ThemeData buildTheme() {
  final base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.accent,
      secondary: AppColors.primary,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      titleLarge: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.text),
      titleMedium: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.text),
      bodyMedium: GoogleFonts.poppins(fontSize: 14, color: AppColors.text),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.primary,
      hintStyle: TextStyle(color: AppColors.text.withOpacity(.7)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: AppColors.text,
    ),
  );
}
