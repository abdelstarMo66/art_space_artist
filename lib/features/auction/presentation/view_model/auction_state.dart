import 'package:freezed_annotation/freezed_annotation.dart';
part'auction_state.freezed.dart';
@freezed
class AuctionState<T> with _$AuctionState<T> {
  const factory AuctionState.initial() = _Initial;

  const factory AuctionState.addCoverPhotoAuction() = AddCoverPhotoAuction;
  const factory AuctionState.createAuctionLoading() = CreateAuctionLoading;
  const factory AuctionState.createAuctionSuccess(T data) = CreateAuctionSuccess;
  const factory AuctionState.createAuctionError({required String error}) = CreateAuctionError;

  const factory AuctionState.getStylesLoading() = GetStylesLoading;
  const factory AuctionState.getStylesSuccess(T data) = GetStylesSuccess;
  const factory AuctionState.getStylesError({required String error}) = GetStylesError;

  const factory AuctionState.getCategoriesLoading() = GetCategoriesLoading;
  const factory AuctionState.getCategoriesSuccess(T data) = GetCategoriesSuccess;
  const factory AuctionState.getCategoriesError({required String error}) = GetCategoriesError;

  const factory AuctionState.getSubjectsLoading() = GetBrandsLoading;
  const factory AuctionState.getSubjectsSuccess(T data) = GetBrandsSuccess;
  const factory AuctionState.getSubjectsError({required String error}) = GetBrandsError;

  const factory AuctionState.getAllAuctionsLoading() = GetAllAuctionsLoading;
  const factory AuctionState.getAllAuctionsSuccess(T data) = GetAllAuctionsSuccess;
  const factory AuctionState.getAllAuctionsError({required String error}) = GetAllAuctionsError;

  const factory AuctionState.getAuctionDetailsLoading() = GetAuctionDetailsLoading;
  const factory AuctionState.getAuctionDetailsSuccess(T data) = GetAuctionDetailsSuccess;
  const factory AuctionState.getAuctionDetailsError({required String error}) = GetAuctionDetailsError;

  const factory AuctionState.deleteAuctionLoading() = DeleteAuctionLoading;
  const factory AuctionState.deleteAuctionSuccess(T data) = DeleteAuctionSuccess;
  const factory AuctionState.deleteAuctionError({required String error}) = DeleteAuctionError;
}