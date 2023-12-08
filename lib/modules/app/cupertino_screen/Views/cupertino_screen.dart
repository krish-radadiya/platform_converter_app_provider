import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../utils/Platform_Provider/Provider/platform_provider.dart';
import '../../Material_Screen/Providers/Date_Picker_Provider/date_picker_provider.dart';

class Cupertino_Screen extends StatelessWidget {
  const Cupertino_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Home Screen"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('add');
          },
          icon: Icon(CupertinoIcons.person_add),
        ),
        // leading: const Icon(CupertinoIcons.person_add_solid),
        trailing: CupertinoSwitch(
            value: Provider.of<PlatformProvider>(context, listen: true).isios,
            onChanged: (val) {
              Provider.of<PlatformProvider>(context, listen: false)
                  .changePlatform();
            }),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CupertinoActivityIndicator(
              radius: 20,
            ),
            const SizedBox(
              height: 50,
            ),
            CupertinoButton(
                child: const Text("Date Picker"),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (ctx) {
                        return CupertinoActionSheet(
                          cancelButton: CupertinoActionSheetAction(
                              isDestructiveAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                          title: const Text("Cupertino Date Picker"),
                          message: Container(
                            height: 300,
                            child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                initialDateTime:
                                    Provider.of<DatePickerProvider>(context)
                                        .datePickerModel
                                        .dateTime,
                                use24hFormat: false,
                                onDateTimeChanged: (val) {
                                  Provider.of<DatePickerProvider>(context,
                                          listen: false)
                                      .pickDate(pickedDate: val);
                                }),
                          ),
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () {},
                              child: const Text("Allow"),
                            ),
                          ],
                        );
                      });
                }),
            const SizedBox(
              height: 50,
            ),
            CupertinoButton.filled(
              child: const Text("Time Picker"),
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (ctx) {
                      return CupertinoActionSheet(
                        cancelButton: CupertinoActionSheetAction(
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                        title: const Text("Date Picker"),
                        message: SizedBox(
                          height: 300,
                          child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.time,
                              initialDateTime:
                                  Provider.of<DatePickerProvider>(context)
                                      .datePickerModel
                                      .dateTime,
                              use24hFormat: false,
                              onDateTimeChanged: (val) {
                                Provider.of<DatePickerProvider>(context,
                                        listen: false)
                                    .pickDate(pickedDate: val);
                              }),
                        ),
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {},
                            child: const Text("Allow"),
                          ),
                        ],
                      );
                    });
              },
            ),
            CupertinoContextMenu(
              actions: const [
                CupertinoContextMenuAction(
                  isDefaultAction: true,
                  child: Text("Save"),
                ),
                CupertinoContextMenuAction(
                  isDestructiveAction: true,
                  child: Text("Share"),
                ),
                CupertinoContextMenuAction(
                  child: Text("send"),
                ),
              ],
              child: Container(),
            ),
            SizedBox(height: 10),
            Text(
                "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.day}/"
                "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.month}/"
                "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.year}"),
            Text(
                "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.hour}:"
                "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.minute}"),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton.filled(
              child: const Text("Alert Dialogue Box"),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (ctx) => CupertinoAlertDialog(
                    title: const Text("Platform Convertor App"),
                    content: const Text("you are leave this application??"),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text("Yes"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        isDefaultAction: true,
                      ),
                      CupertinoDialogAction(
                        onPressed: () {},
                        child: const Text("No"),
                        isDestructiveAction: true,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}