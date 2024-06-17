import 'dart:ui';
import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/features/auction/presentation/view_model/auction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/constants/toast_color.dart';
import '../../../../../core/network/api_error_handler.dart';
import '../../../../../core/router/app_router_names.dart';
import '../../../data/models/get_auction_details_response.dart';
import '../../view_model/auction_cubit.dart';

class ViewAuctionDetailsBody extends StatelessWidget {
  final AuctionInfo? auctionInfo;
  const ViewAuctionDetailsBody({super.key, required this.auctionInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  '${auctionInfo!.coverImage.image}',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: ColorManager.lightGray,
                        ),
                        child: SvgPicture.asset(
                          AssetsManager.icBackArrow,
                          colorFilter: const ColorFilter.mode(
                            ColorManager.originalBlack,
                            BlendMode.srcIn,
                          ),
                          height: 35,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      AssetsManager.icEdit,
                      colorFilter: const ColorFilter.mode(
                          ColorManager.primaryColor, BlendMode.srcIn),
                      height: 35,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    BlocListener<AuctionCubit, AuctionState>(
                      listenWhen: (previous, current) => current is DeleteAuctionLoading||
                      current is DeleteAuctionError||
                      current is DeleteAuctionSuccess,
                      listener: (context, state) {
                        state.whenOrNull(
                        deleteAuctionLoading: () {
                           showDialog(
                            context: context,
                            builder: (context) => const Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.primaryColor,
                                )),
                          );
                        },
                        deleteAuctionError: (error) {
                          Navigator.of(context).pop();
                          showToast(
                            msg: '${ServerFailure(error)}',
                            state: ToastState.error,
                          );
                        },
                        deleteAuctionSuccess: (data) {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil(
                              AppRouterNames.home, (route) => false
                          );
                        },
                      );
                      },
                      child: GestureDetector(
                      onTap: () => context.read<AuctionCubit>().emitDeleteProduct(auctionId : auctionInfo!.id, context : context),
                      child: SvgPicture.asset(
                          AssetsManager.icTrash,
                          colorFilter:
                              const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                          height: 35,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          '${auctionInfo!.coverImage.image}',
                          height: 320,
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  auctionInfo!.title,
                  style: TextStyles.textStyle24.copyWith(
                    color: ColorManager.originalBlack,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  auctionInfo!.description,
                  style: TextStyles.textStyle18,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '💸 ${auctionInfo!.price}',
                      style: TextStyles.textStyle18
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      AssetsManager.icTime,
                      colorFilter: const ColorFilter.mode(
                          ColorManager.primaryColor, BlendMode.srcIn),
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 5.0),
                      child: Text(
                        '${auctionInfo!.duration}',
                        style: TextStyles.textStyle18
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Began : ${auctionInfo!.began.split("T")[0]}',
                  style: TextStyles.textStyle18,
                ),
                const SizedBox(height: 14.0,),
                Text(
                  'End : ${auctionInfo!.end.split("T")[0]}',
                  style: TextStyles.textStyle18,
                ),
                const SizedBox(height: 14.0,),
                Text(
                  'Style : ${auctionInfo!.style}',
                  style: TextStyles.textStyle18,
                ),
                const SizedBox(height: 14.0,),
                Text(
                  'category : ${auctionInfo!.category}',
                  style: TextStyles.textStyle18,
                ),
                const SizedBox(height: 14.0,),
                Text(
                  'material : ${auctionInfo!.material}',
                  style: TextStyles.textStyle18,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
