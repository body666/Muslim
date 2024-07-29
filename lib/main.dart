import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SplashScreen/splash_screen.dart';
import 'hadeth/hadeth_details.dart';
import 'HomeScreen/home_screen.dart';
import 'providers/settings_provider.dart';
import 'quran/sura_details.dart';
import 'theming/theming.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late MyProvider provider;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }


  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.local),
      debugShowCheckedModeBanner: false,
      themeMode: provider.themeData,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.DarkTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetails.routeName: (_) => const HadethDetails(),
      },
    );
  }

  void initSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString("lang") ?? "en";
    String theme = prefs.getString("theme") ?? "dark";
    provider.ChangeLanguage(lang);
    if (theme == "light") {
      provider.ChangeTheme(ThemeMode.light);
    } else {
      provider.ChangeTheme(ThemeMode.dark);
    }
  }
}
