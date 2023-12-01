import 'package:art_space_artist/core/components/default_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.onTap,
    this.buttonColor,
    required this.text,
    this.child,
    this.fontSize,
    this.textColor,
    this.textAlign,
    this.fontWeight,
    this.height,
    this.width,
    this.radius,
    this.boxShadow,
  });

  final Function() onTap;
  final Color? buttonColor;
  final String text;
  final Widget? child;
  final double? fontSize;
  final Color? textColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final double? height;
  final double? width;
  final double? radius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: boxShadow,
      ),
      height: height ?? 6.h,
      width: width ?? double.infinity,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            radius ?? 10,
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: buttonColor ?? Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: child ??
                DefaultText(
                  text: text,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  textColor: textColor,
                  textAlign: textAlign,
                ),
          ),
        ),
      ),
    );
  }
}
