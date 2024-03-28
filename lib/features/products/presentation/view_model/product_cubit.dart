import 'package:art_space_artist/features/products/data/models/get_my_products_response.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_state.dart';
import 'package:bloc/bloc.dart';

import '../../data/repo/repo.dart';

class GetMyProductsCubit extends Cubit<GetMyProductsState> {
  final GetMyProductsRepo _getMyProductsRepo;
  GetMyProductsCubit(this._getMyProductsRepo) : super(const GetMyProductsState.initial());

  List<ProductsInfo> ? myProducts ;

  void emitGetMyProducts ()
  async {
    emit(const GetMyProductsState.loading());
    final response = await _getMyProductsRepo.getMyProducts();
    response.when(
        success: (data) {
          print(data.products!.productsInfo![0].price);
          myProducts = data.products!.productsInfo;
          emit(GetMyProductsState.success(data));
        },
        failure: (error) {
          emit(GetMyProductsState.error(error: error));
        });
  }
}