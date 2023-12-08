import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/Time_Picker_Model/time_picker_model.dart';

class TimePickerProvider extends ChangeNotifier {
  TimePicker timePicker = TimePicker(time: TimeOfDay.now());

  void pickTime({required TimeOfDay pickedTime}) {
    timePicker.time = pickedTime;
    notifyListeners();
  }
}
