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
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}