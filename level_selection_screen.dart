import 'package:flutter/material.dart';
import 'package:lingofy_again/app_localizations.dart';
import 'package:lingofy_again/story_list_screen.dart';

class LevelSelectionScreen extends StatelessWidget {
  final List<Story> stories;
  final String language;

  const LevelSelectionScreen({required this.stories, required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('select_level')),
      ),
      body: ListView.builder(
        itemCount: StoryLevel.values.length,
        itemBuilder: (context, index) {
          final level = StoryLevel.values[index];
          final levelStories = stories.where((s) => s.level == level).toList();
          return ListTile(
            title: Text(AppLocalizations.of(context).translate(level.name)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    StoryListScreen(stories: levelStories, level: level, language: language),
              ));
            },
          );
        },
      ),
    );
  }
}
