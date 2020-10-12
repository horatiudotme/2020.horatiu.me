import 'package:flutter/material.dart';

// import 'package:horatiu_me/content/home_feature_items.dart';
import 'package:horatiu_me/utils/utils.dart';
import 'package:yaml/yaml.dart';

class HomeFeaturesTab extends StatefulWidget {
  @override
  _HomeFeaturesTabState createState() => _HomeFeaturesTabState();
}

class _HomeFeaturesTabState extends State<HomeFeaturesTab> {
  Future _future;

  Future<YamlList> _loadFeatures(BuildContext context) async {
    final data = await DefaultAssetBundle.of(context).loadString('./data/features.yaml');
    final mapData = loadYaml(data);
    print(mapData);
    return mapData;
  }

  @override
  void initState() {
    super.initState();
    _future = _loadFeatures(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<YamlList>(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<YamlList> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              YamlMap itemMap = snapshot.data[index];
              return ListTile(
                title: Text(itemMap['title']),
                onTap: () => launchUrl(itemMap['url']),
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class HomeFeaturesTab2 extends StatelessWidget {
  HomeFeaturesTab2(
    this.data, {
    Key key,
  }) : super(key: key);

  final YamlList data;

  @override
  Widget build(BuildContext context) {
    print('HomeFeaturesTab build');
    return ListView.builder(
      itemCount: data.length + 1,
      itemBuilder: (BuildContext context, int index) {
        return index == 0
            ? Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ListTile(
                  title: Text(
                    'My works and I have been featured on',
                    // style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w900),
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
