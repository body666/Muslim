import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String local = "en";

  ChangeLanguage(String langCode) {
   local=langCode;
    notifyListeners();
  }

}
