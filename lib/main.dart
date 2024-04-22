import 'package:flutter/material.dart';
import 'package:islami/hadeth/hadeth_details.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/providers/My_provider.dart';
import 'package:islami/quran/sura_details.dart';
import 'package:islami/theming/theming.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) =>MyProvider(),

      child: const MyApp()));
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MyProvider provider;

  @override
  Widget build(BuildContext context) {
     provider=Provider.of<MyProvider>(context);
     initSharedPref();

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.local),
      debugShowCheckedModeBanner: false,
      themeMode:provider.themeData,
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
  initSharedPref()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  String lang=  prefs.getString("lang")?? "en";
  String theme= prefs.getString("theme")?? "dark";

  provider.ChangeLanguage(lang);

  if(theme=="light")
   {
     provider.ChangeTheme(ThemeMode.light);
   }
  else
    {
      provider.ChangeTheme(ThemeMode.dark);
    }
  }


}



