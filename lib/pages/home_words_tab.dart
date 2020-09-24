import 'package:flutter/material.dart';
import 'package:horatiu_me/content/home_words.dart';

class HomeWordsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kContentWords.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(kContentWords[index]);
      },
    );
  }
}
