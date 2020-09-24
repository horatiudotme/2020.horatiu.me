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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: _buildTextContent(),
      ),
    );
  }

  List<Widget> _buildTextContent() {
    return [
      RichText(
        text: TextSpan(
          text: 'cofounder of ',
          children: [
            LinkTextSpan(text: 'East-Tec, ', url: 'https://www.east-tec.com'),
            LinkTextSpan(text: 'Cyberscrub Technologies, ', url: 'https://www.cyberscrub.com'),
            TextSpan(text: 'and original creator of '),
            LinkTextSpan(text: 'east-tec Eraser, ', url: 'https://www.east-tec.com/eraser/'),
            LinkTextSpan(text: 'east-tec DisposeSecure, ', url: 'http://www.east-tec.com/disposesecure/'),
            LinkTextSpan(
                text: 'east-tec FormatSecure, ',
                url: 'https://web.archive.org/web/20050509180501/http://www.east-tec.com/formatsc/'),
            LinkTextSpan(
                text: 'diskSpace Explorer, ',
                url: 'https://web.archive.org/web/20060406190416/http://www.east-tec.com/diskmanager/'),
            TextSpan(text: 'and other products'),
          ],
        ),
      ),
      SizedBox(height: 16.0),
      RichText(
        text: TextSpan(
          text: 'founder of ',
          children: [
            LinkTextSpan(text: 'Appgramming, ', url: 'https://www.appgramming.com'),
            LinkTextSpan(text: 'Aurelitec, ', url: 'https://www.aurelitec.com'),
            LinkTextSpan(text: 'Tecdrop, ', url: 'https://www.tecdrop.com'),
            TextSpan(text: 'and creator of '),
            LinkTextSpan(
                text: 'Add/Remove Plus!, ',
                url: 'https://web.archive.org/web/20041011051204/http://www.aurelitec.com/software/arplus/'),
            LinkTextSpan(text: 'CinemaDrape, ', url: 'https://www.aurelitec.com/cinemadrape/'),
            LinkTextSpan(text: 'Colortypist, ', url: 'https://www.aurelitec.com/colortypist/'),
            LinkTextSpan(text: 'ColorVeil, ', url: 'https://www.aurelitec.com/colorveil/'),
            LinkTextSpan(text: 'FrameDummy, ', url: 'http://www.appgramming.com/framedummy/'),
            LinkTextSpan(text: 'HTMtied, ', url: 'http://www.aurelitec.com/htmtied/'),
            LinkTextSpan(text: 'InjuredPixels, ', url: 'http://www.aurelitec.com/injuredpixels/'),
            LinkTextSpan(text: 'ISeePass, ', url: 'http://www.tecdrop.com/iseepass/'),
            LinkTextSpan(text: 'LoneColor, ', url: 'http://www.appgramming.com/lonecolor/'),
            LinkTextSpan(text: 'Pitch Black Wallpaper, ', url: 'http://www.tecdrop.com/pitchblackwallpaper/'),
            LinkTextSpan(text: 'PixelHealer, ', url: 'http://www.aurelitec.com/pixelhealer/'),
            LinkTextSpan(text: 'RGB Color Wallpaper, ', url: 'http://www.tecdrop.com/rgbcolorwallpaper/'),
            LinkTextSpan(text: 'Thumbico, ', url: 'http://www.aurelitec.com/thumbico/'),
            LinkTextSpan(text: 'WhatsMyCo, ', url: 'http://www.aurelitec.com/whatsmyco/'),
            LinkTextSpan(
                text: 'Whats On My Computer, ',
                url: 'https://web.archive.org/web/20040622013006/http://www.whatsonmycomputer.com/'),
            TextSpan(text: 'and other programs and apps'),
          ],
        ),
      ),
      SizedBox(height: 16.0),
      RichText(
        text: TextSpan(
          text: 'cofounder of ',
          children: [
            LinkTextSpan(text: 'Rotary Club 1113 Oradea, ', url: 'https://rotary1113.ro/'),
            TextSpan(text: 'cofounder/past president of '),
            LinkTextSpan(text: 'Rotaract Club Oradea, ', url: 'https://www.facebook.com/rotaractoradea/'),
            LinkTextSpan(text: 'tedx', url: 'https://www.ted.com/about/programs-initiatives/tedx-program'),
            TextSpan(text: ' and '),
            LinkTextSpan(text: 'ixperiment', url: 'http://ixperiment.ro/'),
            TextSpan(text: ' speaker '),
          ],
        ),
      ),
    ];
  }
}
