import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/settings_provider.dart';
import '../theming/theming.dart';
class ThemingBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      color: Theme.of(context).colorScheme.onSurface,
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.ChangeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.light,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:provider.themeData==ThemeMode.light?
                          Theme.of(context).colorScheme.onSecondary
                          :Colors.white
                  ),
                ),
                provider.themeData==ThemeMode.light
                    ? Icon(Icons.done, color: Theme.of(context).colorScheme.onSecondary)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.ChangeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.dark,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: provider.themeData==ThemeMode.dark?
                      Theme.of(context).colorScheme.onSecondary
                          :MyThemeData.blackcolor
                  ),
                ),
                provider.themeData==ThemeMode.dark
                    ? Icon(Icons.done, color: Theme.of(context).colorScheme.onSecondary)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
