import 'package:flutter/material.dart';
import 'package:horatiu_me/pages/home.dart';

import 'common/app_strings.dart';

void main() {
  runApp(HoratiuDotMeSite());
}

class HoratiuDotMeSite extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.siteName,
      theme: ThemeData(
        // primaryColor: Colors.black,
        primaryColor: Color(0xFF0983d3),
        accentColor: Color(0xFF0983d3),
        // accentColor: Colors.lightBlue,
        // accentColor: Colors.white,
        // accentColor: Colors.black,

        // canvasColor: Colors.black,
        // brightness: Brightness.dark,
        // accentColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}