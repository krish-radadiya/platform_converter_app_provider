import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules/app/cupertino_screen/views/HomePage.dart';
import 'modules/app/material_screen/views/HomePage.dart';
import 'modules/componants/add_chat/model/add_chat_model.dart';
import 'modules/componants/add_chat/provider/add_chat_provider.dart';
import 'modules/componants/settings_screen/provider/profile_provider.dart';
import 'modules/componants/settings_screen/model/profile_model.dart';
import 'modules/componants/settings_screen/model/theme_model.dart';
import 'modules/componants/settings_screen/provider/theme_provider.dart';
import 'modules/utils/app_converter/model/app_model.dart';
import 'modules/utils/app_converter/provider/app_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool appSwitch = prefs.getBool('appSwitch') ?? false;
  bool appTheme = prefs.getBool('AppTheme') ?? false;
  bool profileSwitch = prefs.getBool('profileSwitch') ?? false;

  String userImage = prefs.getString('userImage') ?? '';
  String userName = prefs.getString('userName') ?? '';
  String userBio = prefs.getString('userBio') ?? '';

  List<String> image = prefs.getStringList('image') ?? [];
  List<String> fullName = prefs.getStringList('fullName') ?? [];
  List<String> phoneNumber = prefs.getStringList('phoneNumber') ?? [];
  List<String> chatConversation = prefs.getStringList('chatConversation') ?? [];
  List<String> date = prefs.getStringList('date') ?? [];
  List<String> time = prefs.getStringList('time') ?? [];

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(
            appModel: AppModel(
              isIos: appSwitch,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(
            themeModel: ThemeModel(
              isDark: appTheme,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(
            profileModel: ProfileModel(
              profileSwitch: profileSwitch,
              userImage: File(userImage),
              userName: TextEditingController(text: userName),
              userBio: TextEditingController(text: userBio),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => AddChatProvider(
            addChatModel: AddChatModel(
              fullName: fullName,
              phoneNumber: phoneNumber,
              chatConversation: chatConversation,
              image: image,
              date: date,
              time: time,
            ),
          ),
        ),
      ],
      builder: (context, _) {
        if ((Provider.of<AppProvider>(context).appModel.isIos == false)) {
          return MaterialApp(
            darkTheme: ThemeData.dark(
              useMaterial3: true,
            ),
            theme: ThemeData.light(
              useMaterial3: true,
            ),
            themeMode: (Provider.of<ThemeProvider>(context).themeModel.isDark)
                ? ThemeMode.dark
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const HomePage(),
            },
          );
        } else {
          return CupertinoApp(
            theme: CupertinoThemeData(
              brightness:
                  (Provider.of<ThemeProvider>(context).themeModel.isDark)
                      ? Brightness.dark
                      : Brightness.light,
            ),
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const Home_Page(),
            },
          );
        }
      },
    ),
  );
}
