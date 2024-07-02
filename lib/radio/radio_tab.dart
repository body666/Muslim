import 'package:Muslim/radio/radio_item.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../data/Models/RadiosModel.dart';
import '../data/api_manager.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer
        .dispose(); // to pause the audio when we left radio screen(that remove the sound from memory )
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(
          "assets/images/radio_image.png",
          width: width,
          height: height * 0.2,
        ),
        const Spacer(),
        FutureBuilder<List<Radios>?>(
            future: ApiManager.getRadios(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SizedBox(
                  height: height * 0.3,
                  child: ListView.builder(
                    physics: const PageScrollPhysics(),
                    itemExtent: width,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) => RadioItem(
                        radio: snapshot.data![index], audioPlayer: audioPlayer),
                  ),
                );
              }
            }),
        const Spacer(),
      ],
    );
  }
}
