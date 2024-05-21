import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:flutter/material.dart';

class EventListItem extends StatelessWidget {
  const EventListItem(
      {super.key,
      required this.imgLink,
      required this.title,
      required this.endDate,
      required this.eventId});
  final String eventId;
  final String imgLink;
  final String title;
  final String endDate;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushReplacementNamed(context, AppRouterNames.eventDetails),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imgLink), fit: BoxFit.fill),
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
                  title,
                  style: TextStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  endDate,
                  style: TextStyles.textStyle16.copyWith(color: ColorManager.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
