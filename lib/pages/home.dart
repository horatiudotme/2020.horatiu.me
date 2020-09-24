import 'package:flutter/material.dart';
import 'package:horatiu_me/common/app_strings.dart';
import 'package:horatiu_me/pages/home_features_tab.dart';
import 'package:horatiu_me/pages/home_intro_tab.dart';
import 'package:horatiu_me/pages/home_words_tab.dart';
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
        drawer: Drawer(),
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
        PopupMenuButton<MenuAction>(
          onSelected: popupMenuSelection,
          itemBuilder: _buildMenuItems,
        ),
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
          child: const Icon(Icons.add),
        )
      ],
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton.extended(
      onPressed: () {},
      icon: const Icon(Icons.contact_page_outlined),
      // icon: Padding(
      //   padding: const EdgeInsets.only(top: 8.0),
      //   child: const Image(
      //     image: AssetImage('images/horatiu2.png'),
      //     width: 48,
      //   ),
      // ),
      // icon: CircleAvatar(backgroundImage: AssetImage('images/horatiu2.png')),
      label: Text('Contact'),
    );
  }
}
