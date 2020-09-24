import 'package:flutter/material.dart';
import 'package:horatiu_me/content/home_features.dart';

class HomeFeaturesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kContentFeatures.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(kContentFeatures[index]);
      },
    );
  }
}
