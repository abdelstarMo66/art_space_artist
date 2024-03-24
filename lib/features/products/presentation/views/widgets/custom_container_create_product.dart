import 'package:flutter/material.dart';

class CustomContainerForCreateProduct extends StatelessWidget {
  final Widget widget;
  final double height;
  const CustomContainerForCreateProduct({super.key, required this.widget, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(25),
            border: Border.all(
              color: Colors.grey,
            )),
        child: widget);
  }
}
