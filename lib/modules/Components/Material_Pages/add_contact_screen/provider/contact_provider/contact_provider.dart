import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter_app_provider/utils/Global/global.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../model/contact_model/contact_model.dart';

class AddChatProvider extends ChangeNotifier {
  AddChatModel addChatModel;

  AddChatProvider({required this.addChatModel});

  pickImage() async {
    ImagePicker pick = ImagePicker();
    XFile? img = await pick.pickImage(source: ImageSource.camera);

    addChatModel.img = File(img!.path);
    notifyListeners();
  }

  pickDate() async {
    if (addChatModel.tempDate != null &&
        addChatModel.tempDate != addChatModel.pickDate) {
      addChatModel.pickDate = addChatModel.tempDate;
    }
    notifyListeners();
  }

  pickTime() async {
    if (addChatModel.tempTime != null &&
        addChatModel.tempTime != addChatModel.pickTime) {
      addChatModel.pickTime = addChatModel.tempTime;
    }
    notifyListeners();
  }

  saveChat() async {
    addChatModel.image.add(addChatModel.img!.path);
    addChatModel.fullName.add(Global.name.text);
    addChatModel.phoneNumber.add(Global.phone.text);
    addChatModel.chatConversation.add(Global.chat.text);
    addChatModel.date.add(
        "${addChatModel.pickDate?.day}/${addChatModel.pickDate?.month}/${addChatModel.pickDate?.year}");
    addChatModel.time
        .add("${addChatModel.pickTime?.hour}:${addChatModel.pickTime?.minute}");

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList('image', addChatModel.image);
    prefs.setStringList('fullName', addChatModel.fullName);
    prefs.setStringList('phoneNumber', addChatModel.phoneNumber);
    prefs.setStringList('chatConversation', addChatModel.chatConversation);
    prefs.setStringList('date', addChatModel.date);
    prefs.setStringList('time', addChatModel.time);

    addChatModel.img = null;
    Global.name.clear();
    Global.phone.clear();
    Global.chat.clear();
    addChatModel.pickDate = null;
    addChatModel.pickTime = null;

    notifyListeners();
  }
}
