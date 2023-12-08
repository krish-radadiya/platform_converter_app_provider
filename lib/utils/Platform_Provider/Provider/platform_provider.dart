import 'package:flutter/cupertino.dart';

class PlatformProvider extends ChangeNotifier {
  // Platform platform = Platform(isIOS: false);
  bool isios = false;
  void changePlatform() {
    isios = !isios;
    notifyListeners();
  }
}
