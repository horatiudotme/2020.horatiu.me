import 'package:flutter/material.dart';
import 'package:horatiu_me/utils/utils.dart';
import 'package:yaml/yaml.dart';

class HomeFeaturesTab extends StatelessWidget {
  HomeFeaturesTab(
    this.data, {
    Key key,
  }) : super(key: key);

  final YamlList data;

  @override
  Widget build(BuildContext context) {
    // print('HomeFeaturesTab build');
    return ListView.builder(
      itemCount: data.length + 1,
      itemBuilder: (BuildContext context, int index) {
        return index == 0
            ? Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ListTile(
                  title: Text(
                    'My works and I have been featured on',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : ListTile(
                title: Text(data[index - 1]['title']),
                subtitle: Text(data[index - 1]['country']),
                onTap: () => launchUrl(data[index - 1]['url']),
              );
      },
    );
  }
}
