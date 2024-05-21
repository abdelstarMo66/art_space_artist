import 'package:art_space_artist/core/components/app_customer_shimmer.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/features/home/data/repositories/home_repository.dart';
import 'package:art_space_artist/features/home/presentation/view_model/home_state.dart';
import 'package:art_space_artist/features/home/presentation/views/widget/event_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/get_event_response.dart';
import '../../data/models/get_my_products_response.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  int productView = 0;

  List<ProductsInfo> myProducts = [];

  void emitGetMyProducts() async {
    emit(const HomeState.getProductLoading());
    final response = await _homeRepo.getMyProducts();
    response.when(success: (data) {
      for (ProductsInfo products in data.products!.productsInfo) {
        myProducts.add(products);
      }
      emit(HomeState.getProductSuccess(data));
    }, failure: (error) {
      emit(HomeState.getProductError(error: error));
    });
  }

  List<EventInfo> allEvents = [];
  final List<Widget> allEventImages = [];
  List<Widget> shimmerEventLoading = [
    AppCustomShimmer(
        child: Container(
      height: 200,
      decoration: BoxDecoration(
        color: ColorManager.originalWhite,
        borderRadius: BorderRadiusDirectional.circular(25.0),
      ),
    )),
    AppCustomShimmer(
        child: Container(
      height: 200,
      decoration: BoxDecoration(
        color: ColorManager.originalWhite,
        borderRadius: BorderRadiusDirectional.circular(25.0),
      ),
    )),
  ];

  void emitGetAllEvents() async {
    emit(const HomeState.getEventLoading());
    final response = await _homeRepo.getAllEvents();
    response.when(success: (data) {
      for (EventInfo event in data.event.eventInfo) {
        allEvents.add(event);
        allEventImages.add(EventListItem(eventInfo: event));
      }
      emit(HomeState.getEventSuccess(data));
    }, failure: (error) {
      emit(HomeState.getEventError(error: error));
    });
  }
}
