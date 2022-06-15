import 'package:flutter/material.dart';

import 'page/story_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: StoryListPage(),
      ),
    );
  }
}