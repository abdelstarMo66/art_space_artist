import 'package:art_space_artist/core/components/loading_widget.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/features/auction/data/models/get_auction_details_response.dart';
import 'package:art_space_artist/features/auction/presentation/view_model/auction_cubit.dart';
import 'package:art_space_artist/features/auction/presentation/view_model/auction_state.dart';
import 'package:art_space_artist/features/auction/presentation/views/widgets/view_auction_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewAuctionDetailsScreen extends StatelessWidget {
  const ViewAuctionDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuctionCubit, AuctionState>(
      builder: (context, state) {
        if(state is GetAuctionDetailsLoading) {
          return const Scaffold(body: Center(child: LoadingWidget(),));
        }else if(state is GetAuctionDetailsError)
          {
            return const Scaffold(body: Center(child: Text('Error please try again', style: TextStyles.textStyle18,),));
          } else {
          AuctionCubit cubit = context.read<AuctionCubit>();
          return ViewAuctionDetailsBody(auctionInfo: cubit.auctionInfo);
        }
          }
    );
  }
}
