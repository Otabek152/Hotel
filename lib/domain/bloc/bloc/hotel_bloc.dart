import 'package:bloc/bloc.dart';
import 'package:hotel_task/domain/api/api.dart';
import 'package:hotel_task/domain/model/book.dart';
import 'package:hotel_task/domain/model/information.dart';
import 'package:hotel_task/domain/model/number.dart';
import 'package:meta/meta.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(HotelInitial()) {
    on<HotelEvent>((event, emit) async {
      try {
        emit(HotelIsLoading());
        final information = await InformationService().getInformation();
        final number = await InformationService().getNumber();
        final book = await InformationService().getBook();
        emit(HotelIsLoaded(
            book: book, information: information, number: number));
      } catch (e) {
        emit(HotelLoadingError(error: e));
      }
    });
  }
}
