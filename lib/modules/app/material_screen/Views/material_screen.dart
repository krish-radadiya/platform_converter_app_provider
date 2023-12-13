import 'package:flutter/material.dart';
import 'package:platform_converter_app_provider/modules/Components/Material_Pages/sliver_screen/Views/sliver_screen.dart';
import 'package:platform_converter_app_provider/utils/Platform_Provider/Provider/platform_provider.dart';
import 'package:provider/provider.dart';
import '../../../Components/Material_Pages/Call_Screen/Views/CallsPage.dart';
import '../../../Components/Material_Pages/Message_Screen/Views/ChatPage.dart';
import '../../../Components/Material_Pages/add_contact_screen/views/add_contact.dart';

class Material_Screen extends StatelessWidget {
  const Material_Screen({Key? key}) : super(key: key);

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
              value:
                  Provider.of<PlatformProvider>(context).changePlatform.isios,
              onChanged: (val) {
                Provider.of<PlatformProvider>(context, listen: false)
                    .switchUi();
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
            CallsPage(),
            ChatPage(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
