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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _currentTabIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // return _buildWrapper(context, constraints);
          return _buildLarge(context);
        } else {
          return _buildMain(context);
        }
      },
    );
  }

  Widget _buildWrapper(BuildContext context, BoxConstraints constraints) {
    return Container(
      color: Color(0xFF111111),
      padding: EdgeInsets.symmetric(horizontal: (constraints.maxWidth - 411) / 2),
      child: Material(
        elevation: 8.0,
        child: _buildMain(context),
      ),
    );
  }

  Widget _buildMain(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
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

  Widget _buildLarge(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.siteName),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Intro'),
            Tab(text: 'Works'),
            Tab(text: 'Features'),
          ],
        ),
      ),
      endDrawer: AppDrawer(),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: _currentTabIndex == 0 ? Colors.grey[200] : null,
              child: HomeIntroTab(),
            ),
          ),
          Expanded(
            child: Container(
              color: _currentTabIndex == 1 ? Colors.grey[200] : null,
              child: HomeWorksTab(),
            ),
          ),
          Expanded(
            child: Container(
              color: _currentTabIndex == 2 ? Colors.grey[200] : null,
              child: HomeFeaturesTab(),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFAB(),
    );
  }

  /// Builds the app bar with the popup menu items.
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(AppStrings.siteName),
      bottom: TabBar(
        tabs: [
          Tab(text: 'Intro'),
          Tab(text: 'Works'),
          Tab(text: 'Features'),
        ],
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
