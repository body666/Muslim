import 'package:flutter/material.dart';
import 'package:islami/theming.dart';
class RadioTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio_image.png"),
        const SizedBox(height: 60),
        const Text("إذاعه القرآن الكريم"),
        const SizedBox(height: 60,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.keyboard_arrow_left_outlined,
            color: MyThemeData.primarycolor,
            size: 50),
            SizedBox(width: 50,),
            Icon(Icons.pause,
              color: MyThemeData.primarycolor,
                size: 50),
            SizedBox(width: 50,),
            Icon(Icons.keyboard_arrow_right_outlined,
              color: MyThemeData.primarycolor,
                size: 50),
          ],
        )
      ],
    );
  }
}
