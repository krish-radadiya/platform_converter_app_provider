import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app_provider/modules/Components/Material_Pages/sliver_screen/model/theme_model/theme_model.dart';
import 'package:platform_converter_app_provider/modules/Components/Material_Pages/sliver_screen/provider/theme_provider/theme_provider.dart';
import 'package:platform_converter_app_provider/utils/Platform_Provider/Model/platform_model.dart';
import 'package:platform_converter_app_provider/utils/Platform_Provider/Provider/platform_provider.dart';
import 'package:provider/provider.dart';
import 'Modules/App/Material_Screen/Providers/Date_Picker_Provider/date_picker_provider.dart';
import 'Modules/App/Material_Screen/Providers/NavigationBar_Provider/navigationbar_provider.dart';
import 'Modules/App/Material_Screen/Providers/Time_Picker_Provider/time_picker_provider.dart';
import 'Modules/App/Material_Screen/Views/material_screen.dart';
import 'modules/app/cupertino_screen/Views/cupertino_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) =>
              PlatformProvider(changePlatform: ChangePlatform(isios: false)),
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
          create: (context) => ThemeProvider(
            themeModel: ThemeModel(
              isDark: true,
            ),
          ),
        ),
      ],
      builder: (context, child) {
        return (Provider.of<PlatformProvider>(context, listen: true)
                    .changePlatform
                    .isios ==
                true)
            ? MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                themeMode:
                    (Provider.of<ThemeProvider>(context).themeModel.isDark ==
                            false)
                        ? ThemeMode.light
                        : ThemeMode.dark,
                routes: {
                  '/': (context) => Material_Screen(),
                },
              )
            : CupertinoApp(
                debugShowCheckedModeBanner: false,
                home: Cupertino_screen(),
              );
      },
    ),
  );
}
