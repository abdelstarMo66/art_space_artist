import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/home/data/models/get_event_response.dart';
import 'package:flutter/material.dart';

class EventListItem extends StatelessWidget {
  final EventInfo eventInfo;

  const EventListItem({super.key, required this.eventInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(
        context,
        AppRouterNames.eventDetails,
        arguments: eventInfo.id,
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(eventInfo.coverImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadiusDirectional.circular(18.0),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 12.0,
              vertical: 6.0,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorManager.lighterGray.withOpacity(0.8),
              borderRadius: const BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(18.0),
                  bottomStart: Radius.circular(18.0)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventInfo.title,
                  style: TextStyles.textStyle18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    eventInfo.end.split("T")[0],
                    style: TextStyles.textStyle14
                        .copyWith(color: ColorManager.darkGray),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
