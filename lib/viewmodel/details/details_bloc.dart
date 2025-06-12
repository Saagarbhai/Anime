import 'package:anime/core/utils/app_export.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final HomeRepository repository = HomeRepository(apiClient: ApiClient());

  DetailBloc() : super(DetailState()) {
    on<LoadAnimeDetail>(_loadAnimeDetail);
  }
  Future<void> _loadAnimeDetail(LoadAnimeDetail event, Emitter emit) async {
    emit(state.copyWith(detailPageStatus: Status.loading));
    try {
      final Anime data = await repository.getAnimeDataById(event.id);

      emit(state.copyWith(detailPageStatus: Status.success, data: data));
    } catch (e) {
      emit(state.copyWith(
          detailPageStatus: Status.failure, errorMessage: e.toString()));
    }
  }
}
