import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/My_provider.dart';
class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter=0;
  double angle=0;
  List<String> zekr=[
    "سبحان الله",
    "الحمد  لله",
    "الله اكبر",
  ];
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    var size=MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                  margin: EdgeInsets.only(top: size.height * 0.07),
                  child: Transform.rotate(
                    angle: angle,
                    child: Theme(
                      data: ThemeData(
                        highlightColor: Colors.transparent,
                        splashColor:  Colors.transparent,
                      ),
                      child: InkWell(
                        onTap: () {
                         setState(() {
                           onSebhaClicked();
                         });
                        },
                        child: Image.asset(
                          provider.themeData==ThemeMode.light?
                          "assets/images/body_sebha_logo.png"
                              :"assets/images/body_sebha_dark.png",

                        height: size.height*0.25, ),
                      ),
                    ),
                  )
              ),
              Container(
                margin: EdgeInsets.only(left: size.height * 0.04),
                  child: Image.asset(
                    provider.themeData==ThemeMode.light?
                    "assets/images/head_sebha_logo.png"
                        :"assets/images/head_sebha_dark.png",
                    height: size.height*0.10,)
              ),
            ],
          ),
          const SizedBox(height: 50),
          Text(  AppLocalizations.of(context)!.sebhaCounter,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color:Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Text("$counter",
                style: const TextStyle(
                fontSize: 30,
                    fontWeight: FontWeight.bold
              ),
              )
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            decoration: BoxDecoration(
                color :Theme.of(context).colorScheme.onSecondary,
                borderRadius: BorderRadius.circular(30)
            ),
              child:InkWell(
                onTap:onSebhaClicked ,
                child: Text(zekr[currentIndex],
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
          ),
          const SizedBox(height:20),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(
                  color :Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(30)
              ),
              child:InkWell(
                onTap:ResetCounter ,
                child: const Text("Reset Counter",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
          )
        ],
      ),
    ) ;
  }

  Future<void> onSebhaClicked() async {
    angle+=3;
    if(counter==33)
     {
       counter=0;
       currentIndex++;
       if(currentIndex>2) //to avoid crash of code
         currentIndex=0;
     }
    counter++;
    setState(() {

    });

  }
  void ResetCounter(){
    counter=0;
    setState(() {

    });
  }

}
