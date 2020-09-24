import 'package:flutter/material.dart';
import 'package:horatiu_me/content/home_features.dart';

class HomeFeaturesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kContentFeatures.length + 1,
      itemBuilder: (BuildContext context, int index) {
        return index == 0
            ? Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ListTile(
                  title: Text(
                    'My works and I have been featured on',
                    // style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w900),
                    style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : ListTile(
                title: Text(kContentFeatures[index - 1]),
                onTap: () {},
              );
      },
    );
  }
}
