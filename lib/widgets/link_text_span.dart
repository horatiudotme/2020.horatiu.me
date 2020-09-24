import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkTextSpan extends TextSpan {
  LinkTextSpan({TextStyle style, String url, String text})
      : super(
            // style: style.copyWith(fontWeight: FontWeight.bold),
            style: TextStyle(fontWeight: FontWeight.bold),
            text: text,
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                // print(url);
                if (await canLaunch(url)) {
                  await launch(
                    url,
                    // forceSafariVC: false,
                  );
                }
              });
}
