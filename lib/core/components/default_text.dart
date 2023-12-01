import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  const DefaultText({
    super.key,
    required this.text,
    this.textColor,
    this.fontWeight,
    this.textAlign,
    this.fontSize,
    this.textDecoration,
  });

  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? fontSize;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Montserrat',
        decoration: textDecoration,
      ),
    );
  }
}
