import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

ThemeData theme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      secondary: secondaryColor,
      primary: primaryColor,
    ),
    useMaterial3: true,
    fontFamily: GoogleFonts.dmSans().fontFamily,
    textTheme: TextTheme(
      // Title XLarge
      displayLarge: GoogleFonts.roboto(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      // Title Large
      displayMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        letterSpacing: 0,
        height: 1.21, // Leading point of 34px (34/28)
      ),
      // Title Medium
      displaySmall: GoogleFonts.dmSans(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: secondaryColor,
      ),
      // Title Small
      headlineMedium: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        letterSpacing: 0,
        height: 1.36, // Leading point of 30px (30/22)
      ),
      // Headline Large
      headlineSmall: GoogleFonts.dmSans(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: secondaryColor,
      ),
      // Headline Small
      titleLarge: GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: secondaryColor,
      ),
      // Subhead Large
      titleMedium: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: secondaryColor,
      ),
      // Subhead Small
      titleSmall: GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: thirdColor,
      ),
      // Body Large
      bodyLarge: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      // Body Medium
      bodyMedium: GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: white,
      ),
      // Body Small
      labelLarge: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        letterSpacing: 0,
        height: 1.5, // Leading point of 18px (18/12)
      ),
      // Label Large
      bodySmall: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      // Label Medium
      labelMedium: GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: secondaryColor,
      ),
      // Label Small
      labelSmall: GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: primaryColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(fontSize: 24, color: white),
      iconTheme: IconThemeData(color: white),
    ),
    iconTheme: IconThemeData(color: white),
    scaffoldBackgroundColor: Colors.white,
  );
}
