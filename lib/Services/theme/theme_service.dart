import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Cache/CacheHelper.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';
//import 'package:testp1/shared/component/constants.dart';

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class ThemeService {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: blacktext,
    //secondaryHeaderColor: blacktext,
    scaffoldBackgroundColor: white,
    //appBarTheme: const AppBarTheme(),
    //dividerColor: Colors.black12,
  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: white,
    // secondaryHeaderColor:white ,
    scaffoldBackgroundColor: black,
    //appBarTheme: const AppBarTheme(),
    //dividerColor: Colors.white54,
  );

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  final _darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isDarkMode) {
    CacheHelper.setBool(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return CacheHelper.get(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSavedDarkMode());
  }
}
