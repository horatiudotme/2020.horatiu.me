// Copyright 2020 Horatiu Tanescu. All rights reserved.
// Use of this source code is governed by the license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:horatiu_me/common/app_strings.dart';
import 'package:horatiu_me/common/custom_icons.dart';
import 'package:horatiu_me/utils/utils.dart';

/// The app drawer.
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              _buildDrawerHeader(context),
              _buildLinkTile(AppStrings.collectsReviewsTitle, AppStrings.collectsReviewsUrl),
              _buildLinkTile(AppStrings.poeziiTitle, AppStrings.poeziiUrl),
              _buildLinkTile(AppStrings.book700753AMTitle, AppStrings.book700753AMUrl),
              Divider(),
              _buildLinkTile(AppStrings.github1Title, AppStrings.github1Url, icon: Icon(CustomIcons.github)),
              _buildLinkTile(AppStrings.github2Title, AppStrings.github2Url, icon: Icon(CustomIcons.github)),
              _buildLinkTile(AppStrings.linkedinTitle, AppStrings.linkedinUrl, icon: Icon(CustomIcons.linkedin)),
              _buildLinkTile(AppStrings.facebookTitle, AppStrings.facebookUrl, icon: Icon(CustomIcons.facebook)),
            ]),
          ),
          _buildFlutterTile(context),
        ],
      ),
    );
  }

  /// Builds the custom App Drawer header.
  Widget _buildDrawerHeader(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight * 2.0,
      child: DrawerHeader(
        child: Text(
          AppStrings.drawerTitle,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  /// Builds a list tile that opens a URL when clicked.
  Widget _buildLinkTile(String title, String url, {Widget icon, TextStyle style}) {
    return ListTile(
      title: Text(title, style: style),
      leading: icon,
      onTap: () => launchUrl(url),
    );
  }

  /// Builds the _Built with Flutter_ list tile.
  Widget _buildFlutterTile(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: Alignment.bottomRight,
        child: _buildLinkTile(
          AppStrings.builtWithTitle,
          AppStrings.builtWithUrl,
          icon: FlutterLogo(),
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }
}
