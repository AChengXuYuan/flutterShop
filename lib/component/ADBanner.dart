import 'package:flutter/material.dart';


class  ADBanner extends StatelessWidget {
  final String advertismentPic;

  ADBanner({Key key, this.advertismentPic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(this.advertismentPic)
    );
  }
}