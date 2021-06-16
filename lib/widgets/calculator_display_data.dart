import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DisplayData extends StatelessWidget {
  DisplayData({this.text, this.color, this.fontSize});

  final Color color;
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
      alignment: Alignment.bottomRight,
      child: AutoSizeText(
        text,
        maxLines: 2,
        minFontSize: 20.0,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
