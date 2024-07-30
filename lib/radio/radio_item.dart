import 'package:Muslim/data/Models/RadiosModel.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
class RadioItem extends StatefulWidget {
  late AudioPlayer audioPlayer;
  final List<Radios> radiosList;
  int initialIndex;

  RadioItem({
    super.key,
    required this.radiosList,
    required this.audioPlayer,
    this.initialIndex = 0,
  });

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isPlayed = false;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.radiosList.isNotEmpty) {
      currentIndex = widget.initialIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        children: [
          Text(
            widget.radiosList.isNotEmpty ? widget.radiosList[currentIndex].name ?? "" : "No Radio Available",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600, fontSize: 25),
          ),
          const SizedBox(
            height: 50,
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      playPrevious();
                    },
                    child: Icon(Icons.skip_previous,
                        color: Theme.of(context).colorScheme.onSecondary,
                        size: 50)),
                const SizedBox(
                  width: 90,
                ),
                GestureDetector(
                  onTap: () {
                    if (widget.radiosList.isNotEmpty) {
                      isPlayed ? pause() : play();
                      setState(() {}
                      );
                    }

                  },
                  child: Icon(
                    isPlayed ? Icons.pause : Icons.play_arrow,
                    size: 50,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                const SizedBox(
                  width: 90,
                ),
                GestureDetector(
                  onTap: () {
                    playNext();
                  },
                  child: Icon(Icons.skip_next,
                      color: Theme.of(context).colorScheme.onSecondary, size: 50),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void play() async {
    isPlayed = true;
    await widget.audioPlayer.setUrl(widget.radiosList[currentIndex].url ?? "");
    await widget.audioPlayer.play();

  }

  void pause() async {
    isPlayed = false;
    await widget.audioPlayer.pause();
  }

  void playNext() {
    if (widget.radiosList.isNotEmpty && currentIndex < widget.radiosList.length - 1) {
      currentIndex++;
      play();

    } else {
      // Optionally, handle the case where the current radio is the last in the list.
      // For example, you might loop back to the first radio:
      // currentIndex = 0;
      // play();
    }
    setState(() {});
  }

  void playPrevious() {
    if (widget.radiosList.isNotEmpty && currentIndex > 0) {
      currentIndex--;
      play();
    } else {
      // Optionally, handle the case where the current radio is the first in the list.
      // For example, you might loop back to the last radio:
      // currentIndex = widget.radiosList.length - 1;
      // play();
    }
    setState(() {});
  }
}
