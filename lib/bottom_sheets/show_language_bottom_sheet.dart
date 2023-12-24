import 'package:flutter/material.dart';
import 'package:islami/theming.dart';
import 'package:provider/provider.dart';
import 'package:islami/providers/My_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.ChangeLanguage("en");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.english,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color:
                  provider.local=="en"?
                  MyThemeData.primarycolor:MyThemeData.blackcolor),
                ),
                provider.local=="en"?
                Icon(Icons.done, color: MyThemeData.primarycolor)
                : SizedBox.shrink(),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.ChangeLanguage("ar");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
             AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color:
                  provider.local=="ar"?
                  MyThemeData.primarycolor:MyThemeData.blackcolor
                  ),
                ),
                provider.local=="ar"?
                Icon(Icons.done, color: MyThemeData.primarycolor)
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
