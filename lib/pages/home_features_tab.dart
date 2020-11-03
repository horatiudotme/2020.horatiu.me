import 'package:flutter/material.dart';
import 'package:horatiu_me/common/app_strings.dart';
import 'package:horatiu_me/content/features/main_features.dart';
import 'package:horatiu_me/content/features/feature_item.dart';
import 'package:horatiu_me/content/features/more_features.dart';
import 'package:horatiu_me/utils/utils.dart';

class HomeFeaturesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildListTitle(context, AppStrings.featuresTitle, subtitle: AppStrings.featuresSubtitle),
        _buildFeaturesList(kMainFeatures),
        _buildListTitle(context, AppStrings.featuresAlsoTitle),
        _buildFeaturesList(kMoreFeatures),
      ],
    );
  }

  Widget _buildListTitle(BuildContext context, String title, {String subtitle}) {
    return SliverToBoxAdapter(
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
        title: Text(title, style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold)),
        subtitle: subtitle != null ? Text(subtitle) : null,
      ),
    );
  }

  Widget _buildFeaturesList(List<FeatureItem> list) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index].name),
            subtitle: Text(list[index].country),
            onTap: () => launchUrl(list[index].url),
          );
        },
        childCount: list.length,
      ),
    );
  }
}
