import 'package:flutter/material.dart';

const TextStyle _style = TextStyle(fontSize: 30, fontWeight: FontWeight.normal);

class FixedWidthText {
  final TextStyle style;
  final String text;
  final Size size;
  FixedWidthText({this.style = _style, required this.text})
      : size = _textSize(text, style);
  // Here it is!
  static Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 375, maxWidth: 375);
    return textPainter.size;
  }
}
