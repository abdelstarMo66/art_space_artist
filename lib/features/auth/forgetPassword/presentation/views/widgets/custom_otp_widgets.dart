import 'package:flutter/material.dart';

import '../../../../../../core/constants/color_manager.dart';


class CustomOTPWidget extends StatelessWidget {
  const CustomOTPWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 50,
      child: Card(
        color: ColorManager.originalWhite,
        child: TextFormField(
          maxLines: 1,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorManager.primaryColor
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorManager.primaryColor
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}
