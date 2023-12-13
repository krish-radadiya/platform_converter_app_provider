import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../componants/add_chat/views/AddChat.dart';
import '../../../componants/call/views/CallsPage.dart';
import '../../../componants/massage_screen/views/ChatPage.dart';
import '../../../componants/settings_screen/SettingsPage.dart';
import '../../../utils/app_converter/provider/app_provider.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_add),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: "CHATS",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: "CALLS",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: "SETTINGS",
          ),
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: const Text(
                  "Platform Converter",
                ),
                trailing: CupertinoSwitch(
                  value: Provider.of<AppProvider>(context).appModel.isIos,
                  onChanged: (val) {
                    Provider.of<AppProvider>(context, listen: false).switchUi();
                  },
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    IndexedStack(
                      index: i,
                      children: [
                        AddChat(),
                        ChatPage(),
                        CallsPage(),
                        SettingsPage(),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
