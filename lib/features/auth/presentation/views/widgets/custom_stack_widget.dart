import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/color_manager.dart';

class CustomStackWidget extends StatelessWidget {
  final String image;
  final Widget widget;

   const CustomStackWidget({super.key, required this.image, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: AlignmentDirectional.topCenter,
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45)),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
              child: SvgPicture.asset(image)),
        ),
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.26,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: ColorManager.originalWhite,
                    borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(65),topStart: Radius.circular(65) )
                ),
                padding: const EdgeInsetsDirectional.only(top: 30.0, end: 20.0, start: 20.0),
                child: widget,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
