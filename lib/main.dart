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
        primaryColor: Colors.black,
        accentColor: Color(0xFF0983d3),
        // brightness: Brightness.dark,
        // accentColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}