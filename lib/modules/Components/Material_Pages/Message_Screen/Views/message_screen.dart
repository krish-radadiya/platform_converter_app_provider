import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../App/Material_Screen/Providers/Date_Picker_Provider/date_picker_provider.dart';
import '../../../../App/Material_Screen/Providers/Time_Picker_Provider/time_picker_provider.dart';

class message_screen extends StatelessWidget {
  const message_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //     onPressed: () {
            //       showModalBottomSheet(
            //           context: context,
            //           builder: (ctx) {
            //             return Container(
            //               height: 200,
            //               width: double.infinity,
            //             );
            //           });
            //     },
            //     child: Text("Modal Bottom Sheet")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                        initialDatePickerMode: DatePickerMode.year,
                        confirmText: "Pick",
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025));

                    Provider.of<DatePickerProvider>(context, listen: false)
                        .pickDate(pickedDate: pickedDate!);
                  },
                  icon: Icon(
                    Icons.calendar_month_rounded,
                    size: 35,
                  ),
                ),
                Text(
                    "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.day}/"
                    "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.month}/"
                    "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.year}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    Provider.of<TimePickerProvider>(context, listen: false)
                        .pickTime(pickedTime: pickedTime!);
                  },
                  icon: Icon(
                    Icons.watch_later,
                    size: 35,
                  ),
                ),
                Text(
                    "${Provider.of<TimePickerProvider>(context, listen: true).timePicker.time.hour}:"
                    "${Provider.of<TimePickerProvider>(context, listen: true).timePicker.time.minute}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
