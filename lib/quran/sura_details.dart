import 'package:Muslim/quran/sura_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<TextSpan> versesSpans = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    SuraModel args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (versesSpans.isEmpty) {
      loadfile(args.index);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            provider.themeData == ThemeMode.light
                ? "assets/images/default_bg.png"
                : "assets/images/dark_bg.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(args.name, style: Theme.of(context).textTheme.bodyLarge),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Card(
          color: Theme.of(context).colorScheme.surface,
          elevation: 14,
          margin: const EdgeInsets.all(18),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.transparent,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: RichText(
                textDirection: TextDirection.rtl,
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                  children: versesSpans,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loadfile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = sura.trim().split("\n");
    setState(() {
      versesSpans = lines
          .asMap()
          .entries
          .map((entry) => TextSpan(
        text: "${entry.value}(${entry.key + 1}) ",
      ))
          .toList();
    });
  }
}
