import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Cache/CacheHelper.dart';

class LocaleController extends GetxController {
  //check if the app is installed for the first time (no stored value in cache)
  Locale initialLocale = CacheHelper.get('lang') == null
      ? Get.deviceLocale! //Set the locale same as the device
      : Locale(CacheHelper.get(
          'lang')!); //Else use the specified locale in the cache

  void changelocale(String langcode) {
    Locale locale = Locale(langcode);
    CacheHelper.setString("lang", langcode);
    Get.updateLocale(locale);
  }
}
