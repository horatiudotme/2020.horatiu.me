// Copyright 2020 Horatiu Tanescu. All rights reserved.
// Use of this source code is governed by the license that can be
// found in the LICENSE file.

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
  static const double largeScreenBreakpoint = 1024.0;
  static const double maxTabViewWidth = 400.0;

  /// The list of available tabs.
  final List<Tab> tabs = <Tab>[
    Tab(text: AppStrings.introTabTitle),
    Tab(text: AppStrings.worksTabTitle),
    Tab(text: AppStrings.featuresTabTitle),
  ];

  /// The current tab index.
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= largeScreenBreakpoint) {
          return _buildColumnLayout(context);
        } else {
          return _buildTabLayout(context);
        }
      },
    );
  }

  /// Builds the tabbed layout on small and medium screens.
  Widget _buildTabLayout(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.siteName),
          bottom: TabBar(tabs: tabs),
        ),
        endDrawer: AppDrawer(),
        body: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: maxTabViewWidth),
            child: TabBarView(
              children: [
                HomeIntroTab(),
                HomeWorksTab(),
                HomeFeaturesTab(),
              ],
            ),
          ),
        ),
        floatingActionButton: _buildFAB(),
      ),
    );
  }

  /// Builds the column layout on large screens.
  Widget _buildColumnLayout(BuildContext context) {
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
              title: const Text(AppStrings.siteName),
              bottom: TabBar(tabs: tabs),
            ),
            endDrawer: AppDrawer(),
            body: Row(
              children: [
                _buildTabColumn(0, HomeIntroTab()),
                _buildTabColumn(1, HomeWorksTab()),
                _buildTabColumn(2, HomeFeaturesTab()),
              ],
            ),
            floatingActionButton: _buildFAB(),
          );
        },
      ),
    );
  }

  /// Builds the tab column with the specified [index] and [child].
  Widget _buildTabColumn(int index, Widget child) {
    return Expanded(
      child: Container(
        color: _currentTabIndex == index ? Colors.grey[200] : null,
        child: child,
      ),
    );
  }

  /// Builds the Floating Action Button.
  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () => launchUrl(AppStrings.mailtoUrl),
      child: const Icon(Icons.email_outlined),
    );
  }
}
