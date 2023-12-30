import 'package:flutter/material.dart';
import 'package:islami/providers/My_provider.dart';
import 'package:provider/provider.dart';
import 'hadeth_model.dart';
import 'package:flutter/services.dart';
class HadethDetails extends StatelessWidget {
  static const String routeName="HadethDetails";
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    var args=ModalRoute.of(context)
        ?.settings.arguments as HadethModel;
    return Container(
      decoration:  BoxDecoration(
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
          title: Text(args.title,style:
          Theme.of(context).textTheme.bodyLarge
          ),
        ),
        body: Card(
          color: Theme.of(context).colorScheme.surface,
          elevation: 14,
          margin: const EdgeInsets.all(18),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                width: 2,
                color:Colors.transparent,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: ListView.separated(
                separatorBuilder:(context, index) => const Divider(
                  indent: 40,
                  endIndent:40 ,
                  thickness: 1,
                ),
                itemBuilder: (context,index) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "${args.content[index]}",
                      textAlign:TextAlign.center ,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),

                    ),
                  );
                },
                itemCount:args.content.length),
          ),
        ),
      ),
    );
  }
}
