import 'package:flutter/material.dart';
import 'package:islami/theming.dart';
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
    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
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
                           OnSebhaClicked();
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
          SizedBox(height: 50),
          Text(  AppLocalizations.of(context)!.sebhaCounter,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color:Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Text("$counter",
                style: TextStyle(
                fontSize: 30,
                    fontWeight: FontWeight.bold
              ),
              )
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            decoration: BoxDecoration(
                color :Theme.of(context).colorScheme.onSecondary,
                borderRadius: BorderRadius.circular(30)
            ),
              child:Text(zekr[currentIndex],
                style: TextStyle(
                  color: Colors.white,
                ),
              )
          )
        ],
      ),
    ) ;
  }
  void OnSebhaClicked(){
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
}
