import 'package:flutter/material.dart';

class PageControllerProvider extends ChangeNotifier {
  final PageController pageController = PageController(initialPage: 2);
  int currentIndex = 2;
  final Map<int, PageController> _controllers = {};
  final Map<int, int> _currentImageIndex = {};
  PageController getController(int index) => _controllers[index]!;
  int getCurrentImageIndex(int index) => _currentImageIndex[index]!;

  void jumpToPage(int index) {
    pageController.jumpToPage(index);
    currentIndex = index;
    notifyListeners();
  }
}
