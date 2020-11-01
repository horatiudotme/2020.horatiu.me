import 'package:flutter/material.dart';
import 'package:horatiu_me/content/works/contributions.dart';
import 'package:horatiu_me/content/works/work_item.dart';
import 'package:horatiu_me/content/works/works.dart';
import 'package:horatiu_me/utils/utils.dart';

class HomeWorksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildListTitle(context, 'Some of my works'),
        _buildWorksList(kWorks),
        _buildListTitle(context, 'Some of my contributions'),
        _buildWorksList(kContributions),
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

  Widget _buildWorksList(List<WorkItem> list) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index].name),
            subtitle: Text(list[index].title),
            onTap: () => launchUrl(list[index].url),
          );
        },
        childCount: list.length,
      ),
    );
  }
}
