import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  final Story story;

  StoryPage({required this.story});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int _currentPageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.story.title),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: story.pages.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Text(
                    widget.story.[index].text,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPageIndex == story.pages.length - 1) {
                      Navigator.pop(context);
                    } else {
                      setState(() {
                        _currentPageIndex++;
                        _pageController.animateToPage(
                          _currentPageIndex,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      });
                    }
                  },
                  child: Text(
                    _currentPageIndex == widget.story.pages.length - 1
                        ? 'Finish'
                        : 'Next',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Story {
  String title;
  List<String> paragraphs;

  Story({required this.title, required this.paragraphs});
}
