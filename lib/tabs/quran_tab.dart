import 'package:flutter/material.dart';
import 'package:islami/sura_details.dart';
import 'package:islami/sura_model.dart';
import 'package:islami/theming.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class QuranTab extends StatelessWidget {
  List<String>SuraNames=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
            child: Image.asset("assets/images/qur2an_screen_logo.png")
        ),

        Divider(
          thickness: 3,
          color: MyThemeData.primarycolor,
        ),

        Text(
          AppLocalizations.of(context)!.suraName,
          textAlign: TextAlign.center,
          style:
          Theme.of(context).textTheme.bodyMedium,),
        Divider(
          thickness: 3,
          color: MyThemeData.primarycolor,
        ),

        Expanded(
          flex: 3,
          child: ListView.separated(
              itemBuilder: (_,index) {
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context,SuraDetails.routeName,
                    arguments: SuraModel(SuraNames[index], index) );
                  },
                  child: Text(
                      SuraNames[index],
                      textAlign: TextAlign.center,
                      style:
                        Theme.of(context).textTheme.bodySmall,
                    ),
                );
              },
              separatorBuilder: (_,index)  {
                return Divider(
                  indent: 40,
                    endIndent: 40,
                  color: MyThemeData.primarycolor,
                  thickness: 2,
                );
              },
              itemCount: SuraNames.length),
        )


      ],
    );
  }
}
