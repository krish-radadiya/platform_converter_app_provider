// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/Platform_Provider/Provider/platform_provider.dart';
import '../../../Components/Material_Pages/Call_Screen/Views/call_screen.dart';
import '../../../Components/Material_Pages/Message_Screen/Views/message_screen.dart';
import '../../../Components/Material_Pages/sliver_screen/Views/sliver_screen.dart';
import '../Providers/NavigationBar_Provider/navigationbar_provider.dart';

class Material_Screen extends StatelessWidget {
  Material_Screen({super.key});
  List<Widget> pages = [CallScreen(), const message_screen(), Sliver_screen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<NavigationBarProvider>(context, listen: true)
            .navigationBarModel
            .currentIndex,
        onTap: (val) {
          Provider.of<NavigationBarProvider>(context, listen: false)
              .changeIndex(val: val);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "message"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "setting"),
        ],
      ),
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('add');
          },
          icon: Icon(Icons.add_ic_call_sharp),
        ),
        actions: [
          Switch(
              value: Provider.of<PlatformProvider>(context, listen: true).isios,
              onChanged: (val) {
                Provider.of<PlatformProvider>(context, listen: false)
                    .changePlatform();
              }),
        ],
      ),
      body: PageView(
        controller: Provider.of<NavigationBarProvider>(context, listen: true)
            .pageController,
        onPageChanged: (val) {
          Provider.of<NavigationBarProvider>(context, listen: false)
              .changeIndex(val: val);
        },
        children: pages,
      ),
    );
  }
}
