import 'package:flutter/material.dart';
import 'package:horatiu_me/content/works.dart';

class HomeWorksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kContentWorks.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(kContentWorks[index].title),
          subtitle: Text(kContentWorks[index].subtitle),
        );
      },
    );
  }
}
