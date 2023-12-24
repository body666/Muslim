import 'package:flutter/material.dart';
import 'package:islami/hadeth_details.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/sura_details.dart';
import 'package:islami/theming.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.DarkTheme,
      initialRoute: HomeScreen.routeName,
      routes:{
      HomeScreen.routeName:(_)=>HomeScreen(),
      SuraDetails.routeName:(_)=>SuraDetails(),
        HadethDetails.routeName:(_)=>HadethDetails(),
      },
    );
  }
}



