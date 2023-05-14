import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lingofy_again/localization/app_localizations.dart';
import 'package:lingofy_again/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lingofy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: const [
        Locale('en', ''),
        Locale('fr', ''),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate!,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const HomeScreen(),
    );
  }
}
