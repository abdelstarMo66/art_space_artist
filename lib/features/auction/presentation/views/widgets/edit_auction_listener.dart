import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/auction/presentation/view_model/auction_cubit.dart';
import 'package:art_space_artist/features/auction/presentation/view_model/auction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/color_manager.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/constants/toast_color.dart';

class EditAuctionListener extends StatelessWidget {
  const EditAuctionListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuctionCubit, AuctionState>(
        listenWhen: (previous, current) => current is EditAuctionLoading ||
        current is EditAuctionSuccess||
        current is EditAuctionError,
        listener: (context, state) {
          if( state is EditAuctionLoading) {
            showDialog(
              context: context,
              builder: (context) => const Center(child: CircularProgressIndicator(
                backgroundColor: ColorManager.primaryColor,
              ),),);
          } else if (state is EditAuctionError) {
            Navigator.of(context).pop();
            showToast(msg: state.error,
                state: ToastState.error);
          } else if (state is EditAuctionSuccess){
            Navigator.of(context).pop();
            showToast(
                msg: 'Auction edited successfully',
                state: ToastState.success);
            Navigator.of(context).pushNamedAndRemoveUntil(AppRouterNames.home,
                (route) => false,);
          }
        },
      child: const SizedBox.shrink(
      ),
    );
  }
}
