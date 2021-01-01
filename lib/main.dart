import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inside_out/src/pages/Info1_page.dart';
import 'package:inside_out/src/pages/Info2_page.dart';
import 'package:inside_out/src/pages/scroll_page.dart';
import 'package:inside_out/src/pages/basico_page.dart';
import 'package:inside_out/src/pages/map_page.dart';
import 'package:inside_out/src/pages/mainmenu_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
      statusBarColor: ( Platform.isAndroid ) ? Colors.transparent : Colors.white
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inside Out',
      initialRoute: 'scroll',
      routes:{
        'basico'  : (BuildContext context) => BasicoPage(),
        'scroll'  : (BuildContext context) => ScrollPage(), 
        'menu'    : (BuildContext context) => MainMenuPage(),
        'info1'   : (BuildContext context) => Info1Page(),
        'info2'   : (BuildContext context) => Info2Page(),
        'map'     : (BuildContext context) => MapPage(),
      }
    );
  }
}