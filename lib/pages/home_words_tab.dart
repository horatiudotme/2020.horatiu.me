import 'package:flutter/material.dart';
import 'package:horatiu_me/content/home_words.dart';

class HomeWordsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kContentWords.length + 1,
      itemBuilder: (BuildContext context, int index) {
        return index == 0
            ? Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ListTile(
                  title: Text(
                    'Words about my works',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              )
            : ListTile(
                title: Text(kContentWords[index - 1]),
                onTap: () {},
              );
      },
    );
  }
}
