import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyThemeData{
static const blackcolor= Color(0xFF242424);
static const primarycolor= Color(0xFFB7935F);

 static ThemeData lightTheme = ThemeData(
     scaffoldBackgroundColor: Colors.transparent,
     appBarTheme: AppBarTheme(
       backgroundColor: Colors.transparent,
       centerTitle: true,
       elevation: 0,
       iconTheme: IconThemeData(
         color: MyThemeData.blackcolor
       )
     ),
     textTheme: TextTheme(
       bodyLarge: GoogleFonts.elMessiri(
         fontSize: 30,
         fontWeight: FontWeight.bold,
         color: blackcolor,
       ),
       bodySmall: GoogleFonts.elMessiri(
         fontSize: 20,
         fontWeight: FontWeight.w100,
         color: blackcolor,
       ),
       bodyMedium: GoogleFonts.elMessiri(
         fontSize: 25,
         fontWeight: FontWeight.w600,
         color: blackcolor,
       ),
     ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     type:BottomNavigationBarType.shifting ,
     backgroundColor: primarycolor,
     selectedItemColor:blackcolor,
     unselectedItemColor: Colors.white,
   )
   // useMaterial3: true,
 );

 static ThemeData DarkTheme = ThemeData(
     scaffoldBackgroundColor: Colors.transparent,
     appBarTheme: AppBarTheme(
       backgroundColor: Colors.transparent,
       centerTitle: true,
       elevation: 0,
     ),
     textTheme: TextTheme(
       bodyLarge: GoogleFonts.elMessiri(
         fontSize: 30,
         fontWeight: FontWeight.bold,
         color: Color(0xFF242424),
       ),
       bodySmall: GoogleFonts.elMessiri(
         fontSize: 20,
         fontWeight: FontWeight.w100,
         color: Color(0xFFFFFFFF),
       ),
       bodyMedium: GoogleFonts.elMessiri(
         fontSize: 25,
         fontWeight: FontWeight.w600,
         color: Color(0xFF242424),
       ),
     )
   // useMaterial3: true,
 );



}