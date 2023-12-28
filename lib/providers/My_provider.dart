import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String local = "en";
  ThemeMode themeData=ThemeMode.light;




  ChangeLanguage(String langCode) {
   local=langCode;
    notifyListeners();
  }

  ChangeTheme(ThemeMode theme){
    themeData=theme;
    notifyListeners();
  }


}
