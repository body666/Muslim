import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../data/Models/RadiosModel.dart';
class RadioItem extends StatelessWidget {
 final AudioPlayer audioPlayer;
 final Radios radio;
 const RadioItem({super.key, required this.radio,required this.audioPlayer});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text(
            //AppLocalizations.of(context)!.holyQuranRadio,
           radio.name??"",
          style:Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 25
          )
        ),
        SizedBox(height: height*0.1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: (){},
                icon:Icon(Icons.keyboard_arrow_left_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
                size: 50)),
            const SizedBox(width: 50,),
            IconButton(
                onPressed: (){
                play();
                },
                icon:Icon(Icons.play_arrow,
                color:  Theme.of(context).colorScheme.onSecondary,
                size: 50),
            ),
            IconButton(
              onPressed: (){
                stop();
              },
              icon:Icon(Icons.pause,
                  color:  Theme.of(context).colorScheme.onSecondary,
                  size: 50),),
            const SizedBox(width: 50,),
            IconButton(
                onPressed: (){},
                icon:Icon(Icons.keyboard_arrow_right_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
                size: 50),),
          ],
        ),
      ],
    );
  }

  void play()async{
    await audioPlayer.play(UrlSource(radio.url??""));
  }

  void stop()async{
    await audioPlayer.stop();
  }
}
