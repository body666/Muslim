import 'package:Muslim/providers/My_provider.dart';
import 'package:Muslim/quran/quran_tab.dart';
import 'package:Muslim/radio/radio_tab.dart';
import 'package:Muslim/sebha/sebha_tab.dart';
import 'package:Muslim/settings/settings_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'hadeth/hadeth_tab.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName="HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex=0;
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return  Stack(
      children: [
        Image.asset(
          provider.themeData==ThemeMode.light?
          "assets/images/default_bg.png"
          :"assets/images/dark_bg.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.appTitle,
            style:Theme.of(context).textTheme.bodyLarge,
          ),
         ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedindex,
            onTap: (value){
            setState(() {
              selectedindex=value;
            });
            },
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage("assets/images/icon_quran.png")),
                  label:  "Quran",
                backgroundColor: Theme.of(context).colorScheme.primary
                 ),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                  label:  "Ahadeth",
                  backgroundColor: Theme.of(context).colorScheme.primary
                   ),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                  label:  "Sebha",
                  backgroundColor: Theme.of(context).colorScheme.primary
                 ),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage("assets/images/icon_radio.png")),
                  label:  "Radio",
                  backgroundColor: Theme.of(context).colorScheme.primary
                 ),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label:  "Settings",
                  backgroundColor: Theme.of(context).colorScheme.primary
               ),
            ],
          ),
          body: tabs[selectedindex],
        ),
      ],
    ) ;
  }
  List<Widget>tabs=[
    QuranTab(),HadethTab(),SebhaTab(),RadioTab(),SettingsTab()
  ];
}
