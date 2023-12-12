import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app_provider/utils/Platform_Provider/Provider/platform_provider.dart';
import 'package:provider/provider.dart';
import 'Modules/App/Cupertino_Screen/Views/cupertino_screen.dart';
import 'Modules/App/Material_Screen/Providers/Date_Picker_Provider/date_picker_provider.dart';
import 'Modules/App/Material_Screen/Providers/NavigationBar_Provider/navigationbar_provider.dart';
import 'Modules/App/Material_Screen/Providers/Time_Picker_Provider/time_picker_provider.dart';
import 'Modules/App/Material_Screen/Views/material_screen.dart';
import 'modules/app/material_screen/Providers/theme_provider/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<PlatformProvider>(
          create: (context) => PlatformProvider(),
        ),
        ListenableProvider<DatePickerProvider>(
          create: (context) => DatePickerProvider(),
        ),
        ListenableProvider<TimePickerProvider>(
          create: (context) => TimePickerProvider(),
        ),
        ListenableProvider<NavigationBarProvider>(
          create: (context) => NavigationBarProvider(),
        ),
        ListenableProvider(
          create: (context) => TheamProvider(),
        ),
      ],
      builder: (context, child) {
        return (Provider.of<PlatformProvider>(context, listen: true).isios ==
                true)
            ? MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                themeMode:
                    (Provider.of<TheamProvider>(context).theamChange.isDark ==
                            false)
                        ? ThemeMode.light
                        : ThemeMode.dark,
                routes: {
                  '/': (context) => Material_Screen(),
                },
              )
            : CupertinoApp(
                debugShowCheckedModeBanner: false,
                home: Cupertino_Screen(),
              );
      },
    ),
  );
}
