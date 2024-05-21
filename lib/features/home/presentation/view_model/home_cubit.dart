import 'package:art_space_artist/features/home/data/repositories/home_repository.dart';
import 'package:art_space_artist/features/home/presentation/view_model/home_state.dart';
import 'package:art_space_artist/features/home/presentation/views/widget/event_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/get_my_products_response.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  final List<Widget> images = [
    const EventListItem(
      imgLink: 'assets/images/abstract-3d-painting-coming-life-with-lion.jpg',
    ),
    const EventListItem(
      imgLink: 'assets/images/abstract-art-exhibition-background.jpg',
    ),
    const EventListItem(
      imgLink: 'assets/images/hallway-building.jpg',
    ),
    const EventListItem(
      imgLink:
          'assets/images/portrait-indigenous-person-integrated-into-modern-life.jpg',
    ),
    const EventListItem(
      imgLink: 'assets/images/people-looking-picture-art-gallery.jpg',
    ),
  ];

  int productView = 0;

  List<ProductsInfo> myProducts =[];

  void emitGetMyProducts() async {
    emit(const HomeState.getProductLoading());
    final response = await _homeRepo.getMyProducts();
    response.when(
        success: (data) {
          for(ProductsInfo products in data.products!.productsInfo)
            {
              myProducts.add(products);
            }
      // myProducts = data.products!.productsInfo;
      emit(HomeState.getProductSuccess(data));
    }, failure: (error) {
      emit(HomeState.getProductError(error: error));
    });
  }
}
