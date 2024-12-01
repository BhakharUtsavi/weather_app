import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapar/provider/theme.dart';
import 'package:wallpapar/provider/web_provider.dart';
import 'package:wallpapar/screen/add.dart';
import 'package:wallpapar/screen/ft1.dart';
import 'package:wallpapar/screen/ft10.dart';
import 'package:wallpapar/screen/ft11.dart';
import 'package:wallpapar/screen/ft2.dart';
import 'package:wallpapar/screen/ft3.dart';
import 'package:wallpapar/screen/ft4.dart';
import 'package:wallpapar/screen/ft5.dart';
import 'package:wallpapar/screen/ft6.dart';
import 'package:wallpapar/screen/ft7.dart';
import 'package:wallpapar/screen/ft8.dart';
import 'package:wallpapar/screen/ft9.dart';
import 'package:wallpapar/screen/homepage.dart';
import 'package:wallpapar/screen/load.dart';
import 'package:wallpapar/screen/searchcity.dart';
import 'package:wallpapar/screen/splash.dart';
import 'package:wallpapar/screen/st1.dart';
import 'package:wallpapar/screen/st2.dart';
import 'package:wallpapar/screen/st3.dart';
import 'package:wallpapar/screen/st4.dart';
import 'package:wallpapar/screen/st5.dart';
import 'package:wallpapar/screen/st6.dart';
import 'package:wallpapar/screen/st7.dart';
import 'package:wallpapar/screen/st8.dart';
import 'package:wallpapar/screen/st9.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => WebProvider()),
      ],
        builder: (context, val) {
          return Consumer<ThemeProvider>(
              builder: (context, themeProvider, val) {
                return MaterialApp(debugShowCheckedModeBanner: false,
                    theme: ThemeData.light(),
                    darkTheme: ThemeData.dark(),
                    themeMode: themeProvider.currentMode,
                    routes: {
                      '/': (context) => Splash(),
                      'home': (context) => HomePage(),
                      'load': (context) => Load(),
                      'searchcity': (context) => WeatherApp(),


                      'ft1': (context) => Ft1(),
                      'ft2': (context) => Ft2(),
                      'ft3': (context) => Ft3(),
                      'ft4': (context) => Ft4(),
                      'ft5': (context) => Ft5(),
                      'ft6': (context) => Ft6(),
                      'ft7': (context) => Ft7(),
                      'ft8': (context) => Ft8(),
                      'ft9': (context) => Ft9(),
                      'ft10': (context) => Ft10(),
                      'ft11': (context) => Ft11(),
                      'st1': (context) => St1(),
                      'st2': (context) => St2(userId: 1,),
                      'st3': (context) => St3(),
                      'st4': (context) => St4(),
                      'st5': (context) => St5(),
                      'st6': (context) => St6(),
                      'st7': (context) => St7(),
                      'st8': (context) => St8(),
                      'st9': (context) => St9(),
                    });
              });
        },
      )
  );
}
