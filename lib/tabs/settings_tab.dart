import 'package:flutter/material.dart';
import 'package:islami/providers/My_provider.dart';
import 'package:islami/theming.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../bottom_sheets/show_language_bottom_sheet.dart';
import '../bottom_sheets/show_theming_bottom_sheet.dart';
class SettingsTab extends StatefulWidget {

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
            style: TextStyle(
              color: provider.themeData==ThemeMode.light?
                  Colors.black87:
                  Colors.white
            ),
          ),
          InkWell(
            onTap: () {
              ShowLanguageBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.only(left: 18),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 2,
                  color:  Theme.of(context).colorScheme.onSecondary,
                )
              ),
              child: Text(provider.local=="en"?
                  AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic

              ),
            ),
          ),

          SizedBox(height: 15,),

          Text(AppLocalizations.of(context)!.theme,
          style: TextStyle(
              color: provider.themeData==ThemeMode.dark?
              Colors.white:
              Colors.black87
          ),
          ),
          InkWell(
            onTap: () {
              ShowThemingBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.only(left: 18),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 2,
                      color:Theme.of(context).colorScheme.onSecondary,
                  )
              ),
              child: Text(provider.themeData==ThemeMode.light?
                  AppLocalizations.of(context)!.light:
              AppLocalizations.of(context)!.dark
              ),
            ),
          ),
        ],
      ),
    );
  }

  void ShowLanguageBottomSheet(){
    showModalBottomSheet(
      isScrollControlled: false,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.transparent
          )
        ),
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        },
    );
  }

  void ShowThemingBottomSheet(){
    showModalBottomSheet(
      isScrollControlled: false,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
              color: Colors.transparent
          )
      ),
      context: context,
      builder: (context) {
        return ThemingBottomSheet();
      },
    );
  }
}
