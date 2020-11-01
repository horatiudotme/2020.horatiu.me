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
      child: ListView(
        children: <Widget>[
          _buildDrawerHeader(context),
          _buildLinkListTile(null, AppStrings.collectsReviewsTitle, AppStrings.collectsReviewsUrl),
          _buildLinkListTile(null, AppStrings.poeziiTitle, AppStrings.poeziiUrl),
          _buildLinkListTile(null, AppStrings.book700753AMTitle, AppStrings.book700753AMUrl),
          Divider(),
          _buildLinkListTile(CustomIcons.github_circled, AppStrings.github1Title, AppStrings.github1Url),
          _buildLinkListTile(CustomIcons.github_circled, AppStrings.github2Title, AppStrings.github2Url),
          _buildLinkListTile(CustomIcons.linkedin_circled, AppStrings.linkedinTitle, AppStrings.linkedinUrl),
          _buildLinkListTile(CustomIcons.facebook_circled, AppStrings.facebookTitle, AppStrings.facebookUrl),
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
  Widget _buildLinkListTile(IconData icon, String title, String url) {
    return ListTile(
      title: Text(title),
      leading: icon != null ? Icon(icon) : null,
      onTap: () => launchUrl(url),
    );
  }
}
