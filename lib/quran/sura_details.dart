import 'package:Muslim/quran/sura_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/My_provider.dart';
class SuraDetails extends StatefulWidget {
static const String routeName ="SuraDetails";

@override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    SuraModel args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(verses.isEmpty){
      loadfile(args.index);
    }
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            provider.themeData==ThemeMode.light?
                "assets/images/default_bg.png"
                :"assets/images/dark_bg.png",
          ),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        appBar:AppBar(
          title: Text(args.name,style:
            Theme.of(context).textTheme.bodyLarge
          ),
        ),
        body: Card(
          color: Theme.of(context).colorScheme.onSurface,
          elevation: 14,
          margin: const EdgeInsets.all(18),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.transparent,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: ListView.separated(
                 separatorBuilder:(context, index) => const Divider(
                 //  color: Colors.transparent,
                          indent: 40,
                        endIndent:40 ,
                       thickness: 1,
                       ),
                itemBuilder: (context,index) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text("${verses[index]}(${index+1})",
                      textAlign:TextAlign.center ,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary
                      ),

                    ),
                  );
                },
            itemCount: verses.length),
          ),
        ),
      ),
    );
  }
 List<String> verses=[];
 void loadfile(int index)async{
  String sura =await rootBundle.loadString("assets/files/${index+1}.txt");
  List<String> lines=sura.split("\n");
   verses =lines;
   setState(() {
 });

 }
}
