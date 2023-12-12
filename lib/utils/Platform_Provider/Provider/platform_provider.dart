import 'package:flutter/cupertino.dart';

import '../Model/platform_model.dart';

class PlatformProvider extends ChangeNotifier {
  // Platform platform = Platform(isIOS: false);
  bool isios = false;
  void changePlatform() {
    isios = !isios;
    notifyListeners();
  }
}

class switchprovider extends ChangeNotifier {
  bool isprofile = true;

  void changeprofile(bool n) {
    isprofile = !isprofile;
    notifyListeners();
  }
}

class profileprovider extends ChangeNotifier {
  pofile Plat1 = pofile(isios1: true);
  void changeprofile1(bool a) {
    Plat1.isios1 = !Plat1.isios1;
    notifyListeners();
  }
}

class profileprovider2 extends ChangeNotifier {
  pofile2 Plat2 = pofile2(isios2: true);
  void changeprofile2(bool a) {
    Plat2.isios2 = !Plat2.isios2;
    notifyListeners();
  }
}
