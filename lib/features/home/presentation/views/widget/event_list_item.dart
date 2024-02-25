import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:flutter/material.dart';

class EventListItem extends StatelessWidget {
  const EventListItem({super.key, required this.imgLink,});

  final String imgLink;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, AppRouterNames.eventDetails),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imgLink), fit: BoxFit.fill),
              borderRadius: BorderRadiusDirectional.circular(25.0),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(
              top: 5.0,
              start: 5.0,
              end: 5.0,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(25),
                  bottomStart: Radius.circular(25.0)),
            ),
            height: MediaQuery.of(context).size.height * 0.09,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Inspiration event',
                  style: TextStyles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 18.0,),
                const Row(
                  children: [
                    Text('Paints: 5', style: TextStyles.textStyle16,),
                    Spacer(),
                    Text('12 Feb 2024', style: TextStyles.textStyle16),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
