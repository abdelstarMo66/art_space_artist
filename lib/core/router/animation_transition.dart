import 'package:flutter/cupertino.dart';

class SlideRight extends PageRouteBuilder {
  final Widget page;
  SlideRight({required this.page})
      : super(
    pageBuilder: (context, animation, animationTwo) => page,
    transitionsBuilder: (context, animation, animationTwo, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

// ScaleTransition => begin and end must be double value
// RotationTransition => begin and end must be double value
// SlideTransition => begin and end must be offset value
// SizeTransition => Align(child: SizeTransition(sizeFactor: animation,child: child,),);
// FadeTransition => FadeTransition(opacity: animation,child: child,);