import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderPhone extends StatelessWidget {
  final String pic;
  final String phoneNumber;

  LeaderPhone({Key key, this.phoneNumber, this.pic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(this.pic)
      )
    );
  }

  void _launchURL() async {
    String url = 'tel:'+ this.phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}