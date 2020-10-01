import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkListTile extends StatelessWidget {
  const LinkListTile({
    Key key,
    this.title,
    @required this.url,
  }) : super(key: key);

  final Widget title;

  final String url;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      onTap: () async {
        if (await canLaunch(url)) {
          await launch(url);
        }
      },
    );
  }
}
