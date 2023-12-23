import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(S.of(context).onBoardingFirstScreenMain),
      ),
    );
  }
}
