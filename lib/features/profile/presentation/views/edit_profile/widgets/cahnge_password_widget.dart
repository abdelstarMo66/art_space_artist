import 'package:flutter/material.dart';
import '../../../../../../core/constants/color_manager.dart';
import '../../../../../../core/router/app_router_names.dart';

class ChangePasswordWidget extends StatelessWidget {
  const ChangePasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: ColorManager.originalWhite,
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(AppRouterNames.changePassword);
        },
        title: const Text('Change Password'),
        leading: const Icon(
          Icons.change_circle,
          color: ColorManager.primaryColor,
        ),
      ),
    );
  }
}
