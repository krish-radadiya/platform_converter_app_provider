import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/platform_model.dart';

class PlatformProvider extends ChangeNotifier {
  // Platform platform = Platform(isIOS: false);
  // bool isios = false;
  // void changePlatform() {
  //   isios = !isios;
  //   notifyListeners();
  // }
  ChangePlatform changePlatform = ChangePlatform(isios: false);

  PlatformProvider({required this.changePlatform});

  switchUi() async {
    changePlatform.isios = !changePlatform.isios;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('switchh', changePlatform.isios);
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
// import 'package:flutter/cupertino.dart';
// import 'package:playtfrom_converter_app/models/app_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AppProvider extends ChangeNotifier {
//   AppModel appModel;
//
//   AppProvider({required this.appModel});
//
//   switchUi() async {
//     appModel.isIos = !appModel.isIos;
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     prefs.setBool('appSwitch', appModel.isIos);
//     notifyListeners();
//   }
// }
