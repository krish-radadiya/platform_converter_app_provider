import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../componants/add_chat/views/AddChat.dart';
import '../../../componants/call/views/CallsPage.dart';
import '../../../componants/massage_screen/views/ChatPage.dart';
import '../../../componants/settings_screen/SettingsPage.dart';
import '../../../utils/app_converter/provider/app_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Platform Converter",
          ),
          actions: [
            Switch(
              value: Provider.of<AppProvider>(context).appModel.isIos,
              onChanged: (val) {
                Provider.of<AppProvider>(context, listen: false).switchUi();
              },
            ),
          ],
          bottom: const TabBar(
            physics: BouncingScrollPhysics(),
            labelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Icon(
                Icons.person_add_alt,
              ),
              Text(
                "CHATS",
              ),
              Text(
                "CALLS",
              ),
              Text(
                "SETTING",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AddChat(),
            ChatPage(),
            CallsPage(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
