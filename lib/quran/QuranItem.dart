import 'package:Muslim/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
class QuranItem extends StatelessWidget {
  final String suraName, suraNumber;

  const QuranItem({super.key, required this.suraNumber, required this.suraName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            suraName,
            style:Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 2,
          height: 50,
            color: Theme.of(context).colorScheme.onSecondary,

        ),
        Expanded(
          child: Text(
            suraNumber,
            style:Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
