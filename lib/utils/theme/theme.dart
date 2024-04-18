import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/utils/theme/theme_colors.dart';

class ApplicationTheme {
  static final darkAppTheme = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    dialogTheme:const DialogTheme(
      backgroundColor: Colors.black,
      iconColor: Colors.white,
      contentTextStyle: TextStyle(color: Colors.white,),
      titleTextStyle: TextStyle(color: Colors.white,),
    ),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.varelaRound(
        color: Colors.white,
        fontSize: 20,
        fontWeight:FontWeight.w200,
        letterSpacing: 5
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
    ),
  );
  static final lightAppTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      iconColor: Colors.black,
      contentTextStyle: TextStyle(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.varelaRound(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w100,
        letterSpacing: 5
      ),
    ),
    scaffoldBackgroundColor: ColorTheme.lightBodyTheme,
    appBarTheme:  AppBarTheme(
      color: ColorTheme.lightAppBarTheme,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
    ),
  );
}
