import 'package:flutter/material.dart';
import 'app_localizations.dart';
import 'story_page.dart';
import 'package:intl/intl.dart';


class StoryListScreen extends StatelessWidget {
  final List<Story> stories;
  final int level;
  final String language;

  const StoryListScreen({required this.stories, required this.level, required this.language});

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text('${appLocalization.translate('level')} $level - ${appLocalization.translate(language)}'),
      ),
      body: ListView.builder(
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${appLocalization.translate('story')} ${index + 1}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryPage(story: stories[index], language: language),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
