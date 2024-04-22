import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppCustomShimmer extends StatelessWidget {
  final Widget child;

  const AppCustomShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorManager.thirdColor,
      highlightColor: ColorManager.moreLightGray,
      child: child,
    );
  }
}
