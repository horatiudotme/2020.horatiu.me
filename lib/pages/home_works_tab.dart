import 'package:flutter/material.dart';
import 'package:horatiu_me/content/works.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeWorksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kContentWorks.length + 1,
      itemBuilder: (BuildContext context, int index) {
        return index == 0
            ? Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ListTile(
                  title: Text(
                    'Some of my works',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : ListTile(
                title: Text(kContentWorks[index - 1].title),
                subtitle: Text(kContentWorks[index - 1].subtitle),
                onTap: () async {
                  final String url = kContentWorks[index - 1].url;
                  if (await canLaunch(url)) {
                    await launch(
                      url,
                      // forceSafariVC: false,
                    );
                  }
                },
              );
      },
    );
  }
}
