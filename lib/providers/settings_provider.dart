import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  String local = "en";
  ThemeMode themeData=ThemeMode.dark;


  ChangeLanguage(String langCode) async {
   local=langCode;
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString("lang", langCode);
    notifyListeners();
  }

  ChangeTheme(ThemeMode theme)async{
    themeData=theme;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("theme",theme== ThemeMode.light?"light":"dark");
    notifyListeners();
  }



}