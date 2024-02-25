import 'package:art_space_artist/features/home/presentation/view_model/home_state.dart';
import 'package:art_space_artist/features/home/presentation/views/widget/event_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

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
      imgLink: 'assets/images/portrait-indigenous-person-integrated-into-modern-life.jpg',
    ),
    const EventListItem(
      imgLink: 'assets/images/people-looking-picture-art-gallery.jpg',
    ),
  ];

  int productView = 0;

  void changeProductView({
  required int viewNum
}) {
    productView = viewNum;
    emit(ChangeViewProduct());
  }
}
