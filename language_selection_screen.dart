import 'package:flutter/material.dart';
import 'package:lingofy_again/app_localizations.dart';
import 'package:lingofy_again/story_list_screen.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> languages = [    {'name': 'English', 'locale': 'en'},    {'name': 'Español', 'locale': 'es'},    {'name': 'Français', 'locale': 'fr'},    {'name': '中文', 'locale': 'zh'},  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.translate('app_title')??''),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (BuildContext context, int index) {
          final language = languages[index];
          return ListTile(
            title: Text(language['name']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryListScreen(
                    language: language['locale'],
                    level: 1,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
