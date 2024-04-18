import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguage {
  static dynamic toEnglish() => Get.updateLocale(const Locale('en'));

  static void toArabic() => Get.updateLocale(const Locale('ar'));
}
