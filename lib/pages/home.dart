import 'package:flutter/material.dart';
import 'package:horatiu_me/common/app_strings.dart';
import 'package:horatiu_me/pages/home_features_tab.dart';
import 'package:horatiu_me/pages/home_intro_tab.dart';
import 'package:horatiu_me/pages/home_words_tab.dart';
import 'package:horatiu_me/widgets/link_list_tile.dart';
import 'package:horatiu_me/widgets/link_text_span.dart';

import 'home_works_tab.dart';

/// Overflow menu items enumeration.
enum MenuAction { reset, share, rate, help }

class MyHomePage extends StatelessWidget {
  /// Performs the tasks of the popup menu items (reset, share, rate, and help).
  void popupMenuSelection(MenuAction item) {
    switch (item) {
      case MenuAction.reset:
        break;
      case MenuAction.share:
        break;
      case MenuAction.rate:
        break;
      case MenuAction.help:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final bool isPortrait = MediaQuery.of(context).size.height >= 500;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        drawer: _buildDrawer(context),
        body: TabBarView(
          children: [
            HomeIntroTab(),
            // HomeWordsTab(),
            HomeWorksTab(),
            HomeFeaturesTab(),
          ],
        ),
        floatingActionButton: _buildFAB(),
      ),
    );
  }

  /// Builds the app bar with the popup menu items.
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      // titleSpacing: 0,
      title: Text(AppStrings.siteName),
      // title: Row(
      //   children: [
      //     CircleAvatar(backgroundImage: AssetImage('images/horatiu2.png')),
      //     SizedBox(width: 8.0),
      //     Text(AppStrings.siteName),
      //   ],
      // ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share),
          // icon: CircleAvatar(backgroundImage: AssetImage('images/horatiu-48.png'), ),
          // icon: Image(image: AssetImage('images/horatiu2.png'), ),
          tooltip: 'Share',
          onPressed: () {},
        ),
        // PopupMenuButton<MenuAction>(
        //   onSelected: popupMenuSelection,
        //   itemBuilder: _buildMenuItems,
        // ),
      ],
      bottom: TabBar(
        tabs: [
          Tab(
            text: 'Intro',
          ),
          Tab(
            text: 'Works',
          ),
          Tab(
            text: 'Features',
          ),
        ],
      ),
    );
  }

  /// Builds the popup menu items for the app bar.
  List<PopupMenuItem<MenuAction>> _buildMenuItems(BuildContext context) {
    return MenuAction.values
        .map(
          (item) => PopupMenuItem<MenuAction>(
            value: item,
            child: Text(AppStrings.menuActions[item]),
          ),
        )
        .toList();
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Links',
              style: Theme.of(context).textTheme.headline6,
            ),
            // decoration: BoxDecoration(
            //   color: Colors.black,
            // ),
          ),
          LinkListTile(
            title: Text('horatiu.collects.reviews'),
            url: 'https://horatiu.collects.reviews',
          ),
          LinkListTile(
            title: Text('poezii.horatiu.me'),
            url: 'https://poezii.horatiu.me',
          ),
          LinkListTile(
            title: Text('7.00 – 7.53 AM'),
            url: 'https://web.archive.org/web/20091022095316/http://www.700753am.com/',
          ),
          Divider(),
          LinkListTile(
            title: Text('LinkedIn'),
            url: 'https://www.linkedin.com/in/horatiudotme',
          ),
          LinkListTile(
            title: Text('Facebook'),
            url: 'https://www.facebook.com/horatiu.me',
          ),
          // Divider(),
        ],
      ),
    );
  }

  /// Builds the two main floating action buttons for increment and decrement.
  Widget _buildFABs(bool isPortrait) {
    return Flex(
      direction: isPortrait ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () => {},
          // tooltip: AppStrings.decrementTooltip,
          child: const Icon(Icons.email_outlined),
        ),
        isPortrait ? const SizedBox(height: 16.0) : const SizedBox(width: 16.0),
        FloatingActionButton(
          onPressed: () => {},
          // tooltip: AppStrings.incrementTooltip,
          child: const Icon(Icons.link),
        )
      ],
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.email_outlined),
      // icon: Padding(
      //   padding: const EdgeInsets.only(top: 8.0),
      //   child: const Image(
      //     image: AssetImage('images/horatiu2.png'),
      //     width: 48,
      //   ),
      // ),
      // icon: CircleAvatar(backgroundImage: AssetImage('images/horatiu2.png')),
    );
  }
}
