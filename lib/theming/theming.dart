import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyThemeData{
static const blackcolor= Color(0xFF242424);
static const primarycolor= Color(0xFFB7935F);

static const primarycolorDark=Color(0xFF141A2E);
static const onprimarycolorDark= Color(0xFFFACC1D);


 static ThemeData lightTheme = ThemeData(
     scaffoldBackgroundColor: Colors.transparent,
     appBarTheme: const AppBarTheme(
       actionsIconTheme: IconThemeData(),
       backgroundColor: Colors.transparent,
       centerTitle: true,
       elevation: 0,
       iconTheme: IconThemeData(
         color: MyThemeData.blackcolor
       ),

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
   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
     type:BottomNavigationBarType.shifting ,
     backgroundColor: primarycolor,
     selectedItemColor:blackcolor,
     unselectedItemColor: Colors.white,
   ),
   colorScheme: const ColorScheme(
       brightness: Brightness.light,
       primary:primarycolor,
       onPrimary: blackcolor,
       secondary:blackcolor ,
       onSecondary: primarycolor,
       error: Colors.red,
       onError: Colors.white,
       // background:Colors.white, onBackground:Colors.white,
       surface: Color(0xFFC7B497),
       onSurface: Color(0xFFF8F8F8)
   ),
   // useMaterial3: true,
 );

 static ThemeData DarkTheme = ThemeData(
     scaffoldBackgroundColor: Colors.transparent,
     appBarTheme: const AppBarTheme(
       backgroundColor: Colors.transparent,
       iconTheme: IconThemeData(
           color: Colors.white
       ),
       centerTitle: true,
       elevation: 0,
     ),
     textTheme: TextTheme(
       bodyLarge: GoogleFonts.elMessiri(
         fontSize: 30,
         fontWeight: FontWeight.bold,
         color:  Colors.white,
       ),
       bodySmall: GoogleFonts.elMessiri(
         fontSize: 20,
         fontWeight: FontWeight.w100,
           color: Colors.white
       ),
       bodyMedium: GoogleFonts.elMessiri(
         fontSize: 25,
         fontWeight: FontWeight.w600,
           color: Colors.white
       ),
     ),
     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
       type:BottomNavigationBarType.shifting ,
       backgroundColor: primarycolorDark,
       selectedItemColor:onprimarycolorDark,
       unselectedItemColor: Colors.white,
     ),
     colorScheme: const ColorScheme(
         brightness: Brightness.dark,
         primary:primarycolorDark,
         onPrimary: onprimarycolorDark,
         secondary:Colors.white,
         onSecondary: onprimarycolorDark,
         error: Colors.red, onError: blackcolor,
         // background:primarycolorDark, onBackground: primarycolorDark,
         surface:primarycolorDark,
         onSurface: Color(0xFF141A2E)
   // useMaterial3: true,
     )
 );



}