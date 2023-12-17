import 'package:flutter/material.dart';
import 'package:islami/theming.dart';
import 'hadeth_model.dart';
class HadethDetails extends StatelessWidget {
  static const String routeName="HadethDetails";
  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)
        ?.settings.arguments as HadethModel;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/default_bg.png"),
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
          elevation: 14,
          margin: const EdgeInsets.all(18),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: MyThemeData.primarycolor,
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
                      "{args.content[index]}",
                      textAlign:TextAlign.center ,),
                  );
                },
                itemCount:args.content.length),
          ),
        ),
      ),
    );
  }
}
