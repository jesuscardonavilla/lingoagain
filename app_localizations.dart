import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  final Locale locale;
  static Map<String, String>? _localizedStrings;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) async {
    final String name = locale.languageCode;
    final String localeName = Intl.canonicalizedLocale(name);

    await initializeMessages(localeName);

    Intl.defaultLocale = localeName;

    return AppLocalizations(locale);
  }

  static Future<void> initializeMessages(String localeName) async {
    final data = await rootBundle.load('assets/i18n/$localeName.json');
    final jsonMap = json.decode(data.toString());
    _localizedStrings = jsonMap.map<String, String>((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key) {
    return _localizedStrings?[key] ?? 'Translation not found: $key';
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return await AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) {
    return false;
  }
}

