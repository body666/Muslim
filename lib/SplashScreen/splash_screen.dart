import 'package:Muslim/HomeScreen/home_screen.dart';
import 'package:Muslim/providers/settings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 class SplashScreen extends StatefulWidget{
 static const String routeName="SplashScreen";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
   void initState() {
    Future.delayed(const Duration(seconds: 3),(){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
   return  Scaffold(
      body: Center(
        child: Column(
         children: [
            Expanded(
              child: Image.asset(provider.themeData==ThemeMode.light?
              "assets/images/splash.png":
              "assets/images/splash_dark.png",fit: BoxFit.cover,width:double.infinity,),
            )
         ],
        ),
      ),
   );
  }
}