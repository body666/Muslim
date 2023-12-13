import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth_tab.dart';
import 'package:islami/tabs/quran_tab.dart';
import 'package:islami/tabs/radio_tab.dart';
import 'package:islami/tabs/sebha_tab.dart';
import 'package:islami/tabs/settings_tab.dart';
import 'package:islami/theming.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName="HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex=0;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset("assets/images/default_bg.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
        appBar: AppBar(
          title: Text("Islami",style:Theme.of(context).textTheme.bodyLarge,
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
                  icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                  label:  "Quran",
                  backgroundColor: MyThemeData.primarycolor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                  label:  "Ahadeth",
                  backgroundColor: MyThemeData.primarycolor ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                  label:  "Sebha",
                  backgroundColor: MyThemeData.primarycolor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                  label:  "Radio",
                  backgroundColor: MyThemeData.primarycolor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label:  "Settings",
                  backgroundColor: MyThemeData.primarycolor),
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
