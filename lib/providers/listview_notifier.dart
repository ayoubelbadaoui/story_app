import 'package:flutter/cupertino.dart';

class ListViewNotifier extends ChangeNotifier {
  int currentStoryPage = 0;
  final double maxHeight = 190;
  final double maxWidth = 100;

  final scrollController = ScrollController();

  updateCurrentStoryPage(int newIndex) {
    //newIndex = newIndex - 2;
    scrollController.animateTo(maxWidth * newIndex,
        duration: const Duration(microseconds: 500), curve: Curves.easeIn);
    //currentStoryPage = newIndex;
    notifyListeners();
  }
}
