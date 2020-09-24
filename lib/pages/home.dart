import 'package:flutter/material.dart';
import 'package:horatiu_me/common/app_strings.dart';
import 'package:horatiu_me/widgets/link_text_span.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.siteName),
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Card(
              child: RichText(
                text: TextSpan(
                  text: 'cofounder of ',
                  // style: DefaultTextStyle.of(context).style,
                  children: [
                    LinkTextSpan(text: 'East-Tec, ', url: 'https://www.east-tec.com'),
                    LinkTextSpan(text: 'Cyberscrub Technologies, ', url: 'https://www.cyberscrub.com'),
                    TextSpan(text: 'and original creator of '),
                    LinkTextSpan(text: 'east-tec Eraser, ', url: 'https://www.east-tec.com/eraser/'),
                    LinkTextSpan(text: 'east-tec DisposeSecure, ', url: 'http://www.east-tec.com/disposesecure/'),
                    LinkTextSpan(text: 'east-tec FormatSecure, ', url: 'https://web.archive.org/web/20050509180501/http://www.east-tec.com/formatsc/'),
                    LinkTextSpan(text: 'diskSpace Explorer, ', url: 'https://web.archive.org/web/20060406190416/http://www.east-tec.com/diskmanager/'),
                    TextSpan(text: 'and other products'),
                  ],
                ),
              ),
            ),

            RichText(
              text: TextSpan(
                text: 'cofounder of ',
                // style: DefaultTextStyle.of(context).style,
                children: [
                  LinkTextSpan(text: 'East-Tec, ', url: 'https://www.east-tec.com'),
                  LinkTextSpan(text: 'Cyberscrub Technologies, ', url: 'https://www.cyberscrub.com'),
                  TextSpan(text: 'and original creator of '),
                  LinkTextSpan(text: 'east-tec Eraser, ', url: 'https://www.east-tec.com/eraser/'),
                  LinkTextSpan(text: 'east-tec DisposeSecure, ', url: 'http://www.east-tec.com/disposesecure/'),
                  LinkTextSpan(text: 'east-tec FormatSecure, ', url: 'https://web.archive.org/web/20050509180501/http://www.east-tec.com/formatsc/'),
                  LinkTextSpan(text: 'diskSpace Explorer, ', url: 'https://web.archive.org/web/20060406190416/http://www.east-tec.com/diskmanager/'),
                  TextSpan(text: 'and other products'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
