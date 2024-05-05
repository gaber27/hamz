import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'constant/colors.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: mainColor,
  textButtonTheme: const TextButtonThemeData(style: ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.transparent))),
  iconButtonTheme: const IconButtonThemeData(style: ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.transparent))),
  textTheme: TextTheme(
      bodyLarge: TextStyle(color: headingColor,fontSize: 18.sp,fontWeight: FontWeight.w900),
      bodyMedium: TextStyle(color: headingColor,fontSize: 14.sp,fontWeight: FontWeight.w500),
      bodySmall: TextStyle(color: headingColor,fontSize: 10.sp,fontWeight: FontWeight.w400),
  ),
  useMaterial3: true,
);