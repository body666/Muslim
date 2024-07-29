import 'package:Muslim/data/Models/RadiosModel.dart';
import 'package:Muslim/data/api_manager.dart';
import 'package:Muslim/radio/radio_item.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

  // @override
  // void dispose() {
  //   audioPlayer.dispose();
  //   super.dispose();
  // }

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
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.connectingofrdaio),
                      const SizedBox(width: 10),
                      const CircularProgressIndicator(),
                    ],
                  ),
                );
              } else {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return SizedBox(
                    height: height * 0.3,
                    child: ListView.builder(
                      physics: const PageScrollPhysics(),
                      itemExtent: width,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) => RadioItem(
                        radiosList: snapshot.data!,
                        audioPlayer: audioPlayer,
                        initialIndex: index,
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
              }
            }),
        const Spacer(),
      ],
    );
  }
}
