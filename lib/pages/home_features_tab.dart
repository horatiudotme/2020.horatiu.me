import 'package:flutter/material.dart';
import 'package:horatiu_me/content/features/main_features.dart';
import 'package:horatiu_me/content/features/feature_item.dart';
import 'package:horatiu_me/content/features/more_features.dart';
import 'package:horatiu_me/utils/utils.dart';

class HomeFeaturesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildListTitle(context, 'My works and I have been featured on'),
        _buildFeaturesList(kMainFeatures),
        _buildListTitle(context, 'And more'),
        _buildFeaturesList(kMoreFeatures),
      ],
    );
  }

  Widget _buildListTitle(BuildContext context, String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
        ),
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
