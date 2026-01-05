import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_downloader/core/config/colors_constant.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsConstant.primaryBackground,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      titleLarge: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xff1E1E1E),
      ),
      headlineLarge: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xff8E9BAE),
      ),
    ),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: ColorsConstant.primaryBackground,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 14.sp,
        color: Color(0xff8E9BAE),
      ),
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontFamilyFallback: [GoogleFonts.roboto().fontFamily ?? 'Roboto'],
    primaryColor: ColorsConstant.primaryBlackText,
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: ColorsConstant.darkgrey, // Darker navbar background
    //   selectedItemColor: ColorsConstant.blue, // Vibrant blue for active icon
    //   unselectedItemColor:
    //       ColorsConstant.greyText, // Muted grey for inactive icons
    //   showUnselectedLabels: false,
    //   showSelectedLabels: false,
    //   type: BottomNavigationBarType.fixed,
    //   selectedIconTheme: const IconThemeData(size: 22),
    //   unselectedIconTheme: const IconThemeData(size: 22),
    //   elevation: 0,
    // ),
  );
}
