import 'dart:developer';

import 'package:app_story_test/providers/listview_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/users.dart';
import '../model/user.dart';
import '../widget/story_widget.dart';

class StoryPage extends StatefulWidget {
  final User user;

  const StoryPage({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  PageController? controller;

  @override
  void initState() {
    super.initState();
    final initialPage = users.indexOf(widget.user);
    controller = PageController(initialPage: initialPage);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _storyPageState =
        Provider.of<ListViewNotifier>(context, listen: true);

    return PageView(
      controller: controller,
      onPageChanged: (int currentIndex) {
        _storyPageState.updateCurrentStoryPage(currentIndex);
        log('current index page ${currentIndex}');
      },
      children: users
          .map((user) => StoryWidget(
                user: user,
                controller: controller!,
              ))
          .toList(),
    );
  }
}


// 
