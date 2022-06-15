import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'page/story_list_page.dart';
import 'providers/listview_notifier.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ListViewNotifier>(create: (_) => ListViewNotifier()),
];

void main() => runApp(
      MultiProvider(
        providers: providers,
        child: MyApp(),
      ),
    );

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
