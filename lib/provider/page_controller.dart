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

  void initializeController(int index, int imageCount) {
    if (!_controllers.containsKey(index)) {
      _controllers[index] = PageController();
      _currentImageIndex[index] = 0;
    }
  }

  void nextImage(int index, int imageCount) {
    if (_currentImageIndex[index]! < imageCount - 1) {
      _currentImageIndex[index] = _currentImageIndex[index]! + 1;
      _controllers[index]!.animateToPage(
        _currentImageIndex[index]!,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void previousImage(int index) {
    if (_currentImageIndex[index]! > 0) {
      _currentImageIndex[index] = _currentImageIndex[index]! - 1;
      _controllers[index]!.animateToPage(
        _currentImageIndex[index]!,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }


}
