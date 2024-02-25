import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/events/presentation/views/widgets/custom_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: const AssetImage(
                'assets/images/abstract-3d-painting-coming-life-with-lion.jpg'),
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, AppRouterNames.home),
                    child: SvgPicture.asset(
                      AssetsManager.icBackArrow,
                      height: 40.0,
                      color: ColorManager.originalWhite,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Container(
                  padding: const EdgeInsetsDirectional.all(16.0),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.70208,
                  decoration: const BoxDecoration(
                    color: ColorManager.originalWhite,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(45),
                      topStart: Radius.circular(45),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Event Name',
                        style: TextStyles.textStyle30
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Event description Event description Event description Event description Event description Event description Event description Event description  Event description Event description ',
                        style: TextStyles.textStyle16,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const CustomInfoRow(
                          text: '5 Ratib Str - Shoubra masr - Cairo - Egypt',
                          icon: AssetsManager.icLocation),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const CustomInfoRow(
                          text: '17 / 11', icon: AssetsManager.icCalender),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const CustomInfoRow(
                          text: '4:00 pm', icon: AssetsManager.icTime),
                    ],
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
