import 'package:flutter/material.dart';

class PageControllerProvider extends ChangeNotifier {
  final PageController pageController = PageController(initialPage: 2);
  int currentIndex = 2;

  void jumpToPage(int index) {
    pageController.jumpToPage(index);
    currentIndex = index;
    notifyListeners();
  }
}
