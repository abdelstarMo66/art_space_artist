import 'package:art_space_artist/core/components/loading_widget.dart';
import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/auction/presentation/view_model/auction_cubit.dart';
import 'package:art_space_artist/features/auction/presentation/view_model/auction_state.dart';
import 'package:art_space_artist/features/auction/presentation/views/widgets/auction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllAuctionsScreen extends StatelessWidget {
  const AllAuctionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset(
                AssetsManager.icBackArrow,
              )),
          leadingWidth: 40.0,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRouterNames.createAuction);
              },
              child: Text(
                'Create a new auction',
                style: TextStyles.textStyle14
                    .copyWith(color: ColorManager.primaryColor),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<AuctionCubit, AuctionState>(
              builder: (context, state) {
            if (state is GetAllAuctionsLoading) {
              return const Center(child: LoadingWidget());
            } else if (state is GetAllAuctionsSuccess) {
              return context.read<AuctionCubit>().myAuctions.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                              AppRouterNames.viewAuctionDetails,
                              arguments: context
                                  .read<AuctionCubit>()
                                  .myAuctions[index].id),
                          child: AuctionItem(index: index)),
                      itemCount: context.read<AuctionCubit>().myAuctions.length,
                    )
                  : Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetsManager.imgDataEmpty,
                            height: MediaQuery.of(context).size.height * 0.35,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            'Not auctions founded',
                            style: TextStyles.textStyle18,
                          ),
                        ],
                      ),
                    );
            } else {
              return const Center(
                  child: Text(
                'not found',
                style: TextStyles.textStyle18,
              ));
            }
          }),
        ));
  }
}
