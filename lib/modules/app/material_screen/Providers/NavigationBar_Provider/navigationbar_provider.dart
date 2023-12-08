import 'package:flutter/cupertino.dart';

import '../../Model/NavigationBar_Model/navigation_bar_model.dart';

class NavigationBarProvider extends ChangeNotifier {
  NavigationBarModel navigationBarModel = NavigationBarModel(currentIndex: 0);
  PageController pageController = PageController();

  void changeIndex({required int val}) {
    navigationBarModel.currentIndex = val;
    pageController.animateToPage(val,
        duration: Duration(milliseconds: 100), curve: Curves.linear);
    notifyListeners();
  }
}
