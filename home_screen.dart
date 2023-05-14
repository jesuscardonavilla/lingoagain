import 'package:flutter/material.dart';
import 'package:lingofy_again/app_localizations.dart';
import 'package:lingofy_again/language_selection_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalization.translate('app_title') ?? ''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LanguageSelectionScreen(),
                  ),
                );
              },
              child: Text(appLocalization.translate('select_language') ?? ''),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(appLocalization.translate('choose_story') ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
