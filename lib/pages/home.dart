import 'package:flutter/material.dart';

import 'package:horatiu_me/common/app_strings.dart';
import 'package:horatiu_me/pages/home_features_tab.dart';
import 'package:horatiu_me/pages/home_intro_tab.dart';
import 'package:horatiu_me/pages/home_works_tab.dart';
import 'package:horatiu_me/utils/utils.dart';
import 'package:horatiu_me/widgets/app_drawer.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Tab> tabs = <Tab>[
    Tab(text: AppStrings.introTabTitle),
    Tab(text: AppStrings.worksTabTitle),
    Tab(text: AppStrings.featuresTabTitle),
  ];

  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // return _buildWrapper(context, constraints);
          return _buildLarge2(context);
        } else {
          return _buildMain(context);
        }
      },
    );
  }

  Widget _buildMain(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.siteName),
          bottom: TabBar(tabs: tabs),
        ),
        endDrawer: AppDrawer(),
        body: TabBarView(
          children: [
            HomeIntroTab(),
            HomeWorksTab(),
            HomeFeaturesTab(),
          ],
        ),
        floatingActionButton: _buildFAB(),
      ),
    );
  }

  Widget _buildLarge2(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.siteName),
          bottom: TabBar(tabs: tabs),
        ),
        endDrawer: AppDrawer(),
        body: TabBarView(
          children: [
            Row(
              children: [
                Expanded(child: HomeIntroTab()),
                Spacer(),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Expanded(child: HomeWorksTab()),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Spacer(),
                Expanded(child: HomeFeaturesTab()),
              ],
            ),
          ],
        ),
        floatingActionButton: _buildFAB(),
      ),
    );
  }

  Widget _buildTabContentOnLarge2(int index, Widget child) {
    return Expanded(
      child: Container(
        color: _currentTabIndex == index ? Colors.grey[200] : null,
        child: child,
      ),
    );
  }

  Widget _buildLarge(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              setState(() {
                _currentTabIndex = tabController.index;
              });
            }
          });
          return Scaffold(
            appBar: AppBar(
              title: Text(AppStrings.siteName),
              bottom: TabBar(tabs: tabs),
            ),
            endDrawer: AppDrawer(),
            body: Row(
              children: [
                _buildTabContentOnLarge(0, HomeIntroTab()),
                _buildTabContentOnLarge(1, HomeWorksTab()),
                _buildTabContentOnLarge(2, HomeFeaturesTab()),
              ],
            ),
            floatingActionButton: _buildFAB(),
          );
        },
      ),
    );
  }

  Widget _buildTabContentOnLarge(int index, Widget child) {
    return Expanded(
      child: Container(
        color: _currentTabIndex == index ? Colors.grey[200] : null,
        child: child,
      ),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () => launchUrl(AppStrings.mailtoUrl),
      child: const Icon(Icons.email_outlined),
    );
  }
}
