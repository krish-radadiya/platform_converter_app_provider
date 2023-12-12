import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class Global {
  static int currentindex = 0;

  static ImagePicker picker = ImagePicker();
  static String? imagePath = "";

  static TextEditingController firstEditingController = TextEditingController();
  static TextEditingController chatEditingController = TextEditingController();
  static TextEditingController numberEditingController =
      TextEditingController();

  static String? firstname;
  static String? chat;
  static String? numberr;
}
