import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manger.dart';

ThemeData theme = ThemeData(
  primarySwatch: Colors.red,
  scaffoldBackgroundColor: ColorManger.scaColor,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorManger.scaColor,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: ColorManger.scaColor,
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      fontFamily: 'Cairo',
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorManger.defaultColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: ColorManger.lColor,
    unselectedItemColor: ColorManger.liColor,
    elevation: 0,
    backgroundColor: ColorManger.blueBold,
  ),
  fontFamily: 'Cairo',
);
