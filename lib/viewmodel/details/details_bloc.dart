import 'package:anime/core/utils/app_export.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
