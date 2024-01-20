part of 'hotel_bloc.dart';

@immutable
sealed class HotelState {}

final class HotelInitial extends HotelState {}
final class HotelIsLoading extends HotelState {}
final class HotelIsLoaded extends HotelState {
  HotelIsLoaded({required this.book , required this.information , required this.number});
  Information information;
  Book book;
  Number number;
}
final class HotelLoadingError extends HotelState {
  HotelLoadingError({required this.error});
  Object error;
}



