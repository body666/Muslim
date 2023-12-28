import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeth_details.dart';
import 'package:islami/hadeth_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadHadeth();
    }

    return Column(
      children: [
        Expanded(flex: 2, child: Image.asset("assets/images/hadeth_logo.png")),
        Divider(
          thickness: 3,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        Text(AppLocalizations.of(context)!.ahadeth),
        Divider(
          thickness: 3,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        Expanded(
          flex: 3,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color:Theme.of(context).colorScheme.onSecondary,
              indent: 40,
              endIndent: 40,
              thickness: 2,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments: allAhadeth[index]);
                },
                child: Text(
                  allAhadeth[index].title,
                  textAlign: TextAlign.center,
                ),
              );
            },
            itemCount: allAhadeth.length,
          ),
        ),
      ],
    );
  }

  void loadHadeth() async {
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeth) {
      List<String> ahadethList = ahadeth.split("#");
      for (int i = 0; i < ahadethList.length; i++) {
        String hadethOne = ahadethList[i];
        List<String> hadethOneLines = hadethOne.trim().split("\n");
        String title = hadethOneLines[0];
        hadethOneLines.removeAt(0);
        List<String> content = hadethOneLines;
        HadethModel hadethModel = HadethModel(title, content);
        allAhadeth.add(hadethModel);
      }
      setState(() {});
    }).catchError((e) {
      print(e.toString());
    });
  }
}
