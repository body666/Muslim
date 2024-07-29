import 'package:Muslim/quran/sura_details.dart';
import 'package:Muslim/quran/sura_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';
import 'QuranItem.dart';

class QuranTab extends StatelessWidget {
  final List<String> SuraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  final List<int> NumberOfVerses = [
    7, // Surah Al-Fatiha
    286, // Surah Al-Baqarah
    200, // Surah Aal-E-Imran
    176, // Surah An-Nisa
    120, // Surah Al-Ma'idah
    165, // Surah Al-An'am
    206, // Surah Al-A'raf
    75, // Surah Al-Anfal
    129, // Surah At-Tawbah
    109, // Surah Yunus
    123, // Surah Hud
    111, // Surah Yusuf
    43, // Surah Ar-Ra'd
    52, // Surah Ibrahim
    99, // Surah Al-Hijr
    128, // Surah An-Nahl
    111, // Surah Al-Isra
    110, // Surah Al-Kahf
    98, // Surah Maryam
    135, // Surah Ta-Ha
    112, // Surah Al-Anbiya
    78, // Surah Al-Hajj
    118, // Surah Al-Mu'minun
    64, // Surah An-Nur
    77, // Surah Al-Furqan
    227, // Surah Ash-Shu'ara
    93, // Surah An-Naml
    88, // Surah Al-Qasas
    69, // Surah Al-Ankabut
    60, // Surah Ar-Rum
    34, // Surah Luqman
    30, // Surah As-Sajda
    73, // Surah Al-Ahzab
    54, // Surah Saba
    45, // Surah Fatir
    83, // Surah Ya-Sin
    182, // Surah As-Saffat
    88, // Surah Sad
    75, // Surah Az-Zumar
    85, // Surah Ghafir
    54, // Surah Fussilat
    53, // Surah Ash-Shura
    89, // Surah Az-Zukhruf
    59, // Surah Ad-Dukhan
    37, // Surah Al-Jathiya
    35, // Surah Al-Ahqaf
    38, // Surah Muhammad
    29, // Surah Al-Fath
    18, // Surah Al-Hujurat
    45, // Surah Qaf
    60, // Surah Adh-Dhariyat
    49, // Surah At-Tur
    62, // Surah An-Najm
    55, // Surah Al-Qamar
    78, // Surah Ar-Rahman
    96, // Surah Al-Waqi'a
    29, // Surah Al-Hadid
    22, // Surah Al-Mujadila
    24, // Surah Al-Hashr
    13, // Surah Al-Mumtahina
    14, // Surah As-Saff
    11, // Surah Al-Jumu'a
    11, // Surah Al-Munafiqun
    18, // Surah At-Taghabun
    12, // Surah At-Talaq
    12, // Surah At-Tahrim
    30, // Surah Al-Mulk
    52, // Surah Al-Qalam
    52, // Surah Al-Haqqah
    44, // Surah Al-Ma'arij
    28, // Surah Nuh
    28, // Surah Al-Jinn
    20, // Surah Al-Muzzammil
    56, // Surah Al-Muddathir
    40, // Surah Al-Qiyama
    31, // Surah Al-Insan
    50, // Surah Al-Mursalat
    40, // Surah An-Naba
    46, // Surah An-Nazi'at
    42, // Surah Abasa
    29, // Surah At-Takwir
    19, // Surah Al-Infitar
    36, // Surah Al-Mutaffifin
    25, // Surah Al-Inshiqaq
    22, // Surah Al-Buruj
    17, // Surah At-Tariq
    19, // Surah Al-A'la
    26, // Surah Al-Ghashiya
    30, // Surah Al-Fajr
    20, // Surah Al-Balad
    15, // Surah Ash-Shams
    21, // Surah Al-Lail
    11, // Surah Ad-Duhaa
    8, // Surah Ash-Sharh
    8, // Surah At-Tin
    19, // Surah Al-Alaq
    5, // Surah Al-Qadr
    8, // Surah Al-Bayyina
    8, // Surah Az-Zalzala
    11, // Surah Al-Adiyat
    11, // Surah Al-Qari'a
    8, // Surah At-Takathur
    3, // Surah Al-Asr
    9, // Surah Al-Humaza
    5, // Surah Al-Fil
    4, // Surah Quraish
    7, // Surah Al-Ma'un
    3, // Surah Al-Kawthar
    6, // Surah Al-Kafirun
    3, // Surah An-Nasr
    5, // Surah Al-Masad
    4, // Surah Al-Ikhlas
    5, // Surah Al-Falaq
    6 // ""Surah An-Nas
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 1,
            child: Image.asset("assets/images/qur2an_screen_logo.png")),
         Divider(
            indent: 10,
            endIndent: 10,
            height: 0,
            thickness: 2,
            color: Theme.of(context).colorScheme.onSecondary,

        ),
        Row(
          children: [
             Expanded(
              child: Text(
                AppLocalizations.of(context)!.suraName,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                width: 2,
                height: mediaQuery.height * 0.056,
                color: Theme.of(context).colorScheme.onSecondary,
            ),
             Expanded(
              child: Text(
                AppLocalizations.of(context)!.versesNumber,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Divider(
            indent: 10,
            endIndent: 10,
            height: 0,
            thickness: 2,
            color: Theme.of(context).colorScheme.onSecondary,
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  SuraDetails.routeName,
                  arguments: SuraModel(SuraNames[index], index),
                );
              },
              child: QuranItem(
                suraName: SuraNames[index],
                suraNumber: NumberOfVerses[index].toString(),
              ),
            ),
            itemCount: SuraNames.length,
          ),
        ),
      ],
    );
  }
}
