import 'package:flutter/material.dart';

class HomeIntroTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/horatiu.jpg'),
                radius: 48.0,
              ),
            ),
            SizedBox(height: 32.0),
            Text('Hello, World!'),
            SizedBox(height: 32.0),
            Text('I am Horațiu (Aurelian) Tănescu, and I create Hello World programs'),
            SizedBox(height: 16.0),
            Text('I also create software products, apps, sites, poems, and real and virtual software companies'),
          ],
        ),
      ),
    );
  }
}
