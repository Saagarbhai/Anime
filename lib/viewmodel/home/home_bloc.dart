import 'package:anime/core/utils/app_export.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository = HomeRepository(apiClient: ApiClient());

  HomeBloc() : super(HomeState()) {
    on<LoadHomePageData>(_loadHomePageData);
  }
  Future<void> _loadHomePageData(LoadHomePageData event, Emitter emit) async {
    emit(state.copyWith(homeStatus: Status.loading));
    try {
      final List<Anime> data = await repository.getAnimeData();
      emit(state.copyWith(homeStatus: Status.success, data: data));
    } catch (e) {
      emit(state.copyWith(
          homeStatus: Status.failure, errorMessage: e.toString()));
    }
  }
}
