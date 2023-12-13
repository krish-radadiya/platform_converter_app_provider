import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class Global {
  static int currentindex = 0;

  static ImagePicker picker = ImagePicker();
  static String? imagePath = "";

  static TextEditingController name = TextEditingController();
  static TextEditingController phone = TextEditingController();
  static TextEditingController chat = TextEditingController();

  static TextEditingController firstEditingController = TextEditingController();
  static TextEditingController chatEditingController = TextEditingController();
  static TextEditingController numberEditingController =
      TextEditingController();

  static String? firstname;
  static String? chats;
  static String? numberr;
}
