import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: ColorManager.primaryColor,
              radius: 20,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.29,),

            Text('LOGO'),
          ],
        )),
    );
  }
}
