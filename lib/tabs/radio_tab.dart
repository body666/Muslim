import 'package:flutter/material.dart';
import 'package:islami/providers/My_provider.dart';
import 'package:islami/theming.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class RadioTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
            "assets/images/radio_image.png"
        ),
        const SizedBox(height: 60),
         Text( AppLocalizations.of(context)!.holyQuranRadio),
        const SizedBox(height: 60,),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [




            Icon(Icons.keyboard_arrow_left_outlined,
            color: Theme.of(context).colorScheme.onSecondary,
            size: 50),
            SizedBox(width: 50,),
            Icon(Icons.pause,
              color:  Theme.of(context).colorScheme.onSecondary,
                size: 50),
            SizedBox(width: 50,),
            Icon(Icons.keyboard_arrow_right_outlined,
              color: Theme.of(context).colorScheme.onSecondary,
                size: 50),
          ],
        )
      ],
    );
  }
}
