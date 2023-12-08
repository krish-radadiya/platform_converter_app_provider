import 'package:flutter/cupertino.dart';
import '../../Model/Date_Picker_Model/date_picker_model.dart';

class DatePickerProvider extends ChangeNotifier {
  DatePickerModel datePickerModel = DatePickerModel(dateTime: DateTime.now());

  void pickDate({required DateTime pickedDate}) {
    datePickerModel.dateTime = pickedDate;
    notifyListeners();
  }
}
