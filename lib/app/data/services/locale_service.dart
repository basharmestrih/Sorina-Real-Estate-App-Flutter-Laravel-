import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class LocaleService extends GetxService {
  static LocaleService instance = Get.find<LocaleService>();  final _box = GetStorage();
  final _key = 'locale';

  // Default locale
  final defaultLocale = Get.deviceLocale ?? Locale('en', 'US');

  Locale getLocale() {
    final langCode = _box.read(_key);
    if (langCode != null) {
      return Locale(langCode);
    }
    return defaultLocale;
  }

  void saveLocale(Locale locale) {
    _box.write(_key, locale.languageCode);
    Get.updateLocale(locale);
  }

  // Toggle example: EN <=> AR
  void toggleLocale() {
    final current = Get.locale?.languageCode ?? defaultLocale.languageCode;
    final newLocale = (current == 'en') ? Locale('ar', 'SY') : Locale('en', 'US');
    saveLocale(newLocale);
  }

  // Add this getter to return the font family depending on current locale
  String get fontType {
    final currentLang = Get.locale?.languageCode ?? defaultLocale.languageCode;
    if (currentLang == 'ar') {
      return 'Cairo'; // Arabic font
    } else {
      return 'Fjalla One'; // English font
    }
  }
}
