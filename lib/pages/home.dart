import 'package:flutter/material.dart';
import 'package:horatiu_me/common/app_strings.dart';
import 'package:horatiu_me/common/custom_icons.dart';
import 'package:horatiu_me/pages/home_features_tab.dart';
import 'package:horatiu_me/pages/home_intro_tab.dart';
import 'package:horatiu_me/utils/utils.dart';
import 'package:horatiu_me/widgets/link_list_tile.dart';
import 'package:yaml/yaml.dart';

import 'home_works_tab.dart';

class MyHomePage extends StatelessWidget {
  Future<List> _loadFeatures(BuildContext context) async {
    final data =
        await DefaultAssetBundle.of(context).loadString('data/features.yaml');
    final YamlList mapData = loadYaml(data);
    // print(mapData);
    // print(mapData.runtimeType);
    //
    // mapData.nodes.forEach((YamlNode node) {
    //   print((node as YamlMap)['name']);
    // });

    List shuffledData = List.from(mapData);
    // shuffledData.shuffle();
    return shuffledData;
    // mapData.shuffle();
    // return mapData;
  }

  @override
  Widget build(BuildContext context) {
    // YamlList featuresData = _loadFeatures(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        // drawer: _buildDrawer(context),
        endDrawer: _buildDrawer(context),
        body: TabBarView(
          children: [
            HomeIntroTab(),
            // HomeWordsTab(),
            HomeWorksTab(),
            FutureBuilder<List>(
              future: _loadFeatures(context),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  return HomeFeaturesTab(snapshot.data);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
        floatingActionButton: _buildFAB(),
      ),
    );
  }

  /// Builds the app bar with the popup menu items.
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(AppStrings.siteName),
      actions: [
        // IconButton(
        //   icon: const Icon(Icons.new_releases),
        //   tooltip: AppStrings.newTooltip,
        //   onPressed: () => launchUrl(AppStrings.newUrl),
        // ),
      ],
      bottom: TabBar(
        tabs: [
          Tab(text: 'Intro'),
          Tab(text: 'Works'),
          Tab(text: 'Features'),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'More links',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          // LinkListTile(
          //   title: Text('poezii.horatiu.me'),
          //   url: 'https://poezii.horatiu.me',
          // ),
          // LinkListTile(
          //   title: Text('7.00 – 7.53 AM'),
          //   url: 'https://web.archive.org/web/20091022095316/http://www.700753am.com/',
          // ),
          _buildLinkListTile(null, AppStrings.collectsReviewsTitle,
              AppStrings.collectsReviewsUrl),
          _buildLinkListTile(
              null, AppStrings.poeziiTitle, AppStrings.poeziiUrl),
          _buildLinkListTile(
              null, AppStrings.book700753AMTitle, AppStrings.book700753AMUrl),
          Divider(),
          _buildLinkListTile(CustomIcons.github_circled,
              AppStrings.github1Title, AppStrings.github1Url),
          _buildLinkListTile(CustomIcons.github_circled,
              AppStrings.github2Title, AppStrings.github2Url),
          _buildLinkListTile(CustomIcons.linkedin_circled,
              AppStrings.linkedinTitle, AppStrings.linkedinUrl),
          _buildLinkListTile(CustomIcons.facebook_circled,
              AppStrings.facebookTitle, AppStrings.facebookUrl),
        ],
      ),
    );
  }

  Widget _buildLinkListTile(IconData icon, String title, String url) {
    return ListTile(
      title: Text(title),
      leading: icon != null ? Icon(icon) : null,
      onTap: () => launchUrl(url),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () => launchUrl(AppStrings.mailtoUrl),
      child: const Icon(Icons.email_outlined),
    );
  }
}
