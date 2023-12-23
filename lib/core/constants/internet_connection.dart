// if internet lost
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/l10n.dart';

class LostConnection extends StatelessWidget {
  const LostConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorManager.originalWhite,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/Onlinegallerypana1.svg',height: MediaQuery.of(context).size.height * 0.5),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Whoops !!",
                style: TextStyles.textStyle24,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 35,
              ),
               const Text(
                "No internet connection found. \n Please check your internet setting}",
                style: TextStyles.textStyle20,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// function to solve package bug

void lostConnection() async{
  var result = await Connectivity().checkConnectivity();
  if(result == ConnectivityResult.none)
    {
      const LostConnection();
    }
}