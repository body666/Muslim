import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islami/providers/My_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Container(
      color: Theme.of(context).colorScheme.onSurface,
      padding:  const EdgeInsets.all(18),
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
                      Theme.of(context).colorScheme.onSecondary
                      :Theme.of(context).colorScheme.onBackground

                  ),
                ),
                  provider.local=="en"
                    ? Icon(Icons.done, color: Theme.of(context).colorScheme.onSecondary)
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
                  Theme.of(context).colorScheme.onSecondary
                      :Theme.of(context).colorScheme.onBackground
                  ),
                ),
                 provider.local=="ar"
                    ? Icon(Icons.done, color: Theme.of(context)!.colorScheme.onSecondary)
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
