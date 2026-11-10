import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({super.key, required this.text, this.fontSize, this.fontWeight, this.colors, this.worldSpacing});
  final String text;
  final double ?fontSize;
  final FontWeight ?fontWeight;
  final Color ? colors;
  final double ? worldSpacing;
  @override
  Widget build(BuildContext context) {
    return  Text(text,style: TextStyle(
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight,
      color: colors,
      wordSpacing:worldSpacing ,
    ),);
  }
}
