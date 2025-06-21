import 'package:anime/core/utils/app_export.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final HomeRepository repository = HomeRepository(apiClient: ApiClient());

  SearchBloc() : super(SearchState()) {
    on<LoadSearchDataEvent>(_loadSearchDataEvent);
    on<OnSearchTextChangeEvent>(_onSearchTextChangeEvent);
    on<OnFilterChangeEvent>(_onFilterChangeEvent);
  }
  Future<void> _loadSearchDataEvent(
      LoadSearchDataEvent event, Emitter emit) async {
    emit(state.copyWith(searchStatus: Status.loading));
    try {
      final List<Anime> data = await repository.getAnimeData();
      if (data.isNotEmpty) {
        emit(state.copyWith(
            searchStatus: Status.success, data: data, filterData: data));
      } else {
        emit(state.copyWith(
            searchStatus: Status.failure, errorMessage: 'Data Not Available'));
      }
    } catch (e) {
      emit(state.copyWith(
          searchStatus: Status.failure, errorMessage: e.toString()));
    }
  }

  void _onSearchTextChangeEvent(OnSearchTextChangeEvent event, Emitter emit) {
    final query = event.query.toLowerCase();
    final filtered = query.isEmpty
        ? state.data
        : state.filterData
            .where((e) => e.title.toLowerCase().contains(query))
            .toList();
    emit(state.copyWith(data: filtered));
  }

  void _onFilterChangeEvent(OnFilterChangeEvent event, Emitter emit) {
    switch (event.filter) {
      case 'ALL':
        emit(state.copyWith(data: state.filterData));
        break;
      case 'TV':
        emit(state.copyWith(
            data: state.filterData.where((e) => e.type == 'TV').toList()));
        break;
      case 'MOVIE':
        emit(state.copyWith(
            data: state.filterData.where((e) => e.type == 'Movie').toList()));
        break;
      case 'MANGA':
        emit(state.copyWith(
            data: state.filterData.where((e) => e.source == 'Manga').toList()));
        break;
      case 'ORIGINAL':
        emit(state.copyWith(
            data: state.filterData
                .where((e) => e.source == 'Original')
                .toList()));
        break;
      case 'EPISODE':
        final filteredAndSorted = state.filterData
            .where((e) => e.episodes != null && e.episodes! > 0)
            .toList()
          ..sort((a, b) => b.episodes!.compareTo(a.episodes!));

        emit(state.copyWith(data: filteredAndSorted));
        break;
      case 'RATING':
        final filteredAndSorted = state.filterData
            .where((e) => e.score != null && e.score! > 0)
            .toList()
          ..sort((a, b) => b.score!.compareTo(a.score!));
        emit(state.copyWith(data: filteredAndSorted));
        break;
      case 'RANK':
        final filteredAndSorted = state.filterData
            .where((e) => e.rank != null && e.rank! > 0)
            .toList()
          ..sort((a, b) => a.rank!.compareTo(b.rank!));
        emit(state.copyWith(data: filteredAndSorted));
        break;
      case 'FAVORITES':
        final filteredAndSorted = state.filterData
            .where((e) => e.favorites != null && e.favorites! > 0)
            .toList()
          ..sort((a, b) => b.favorites!.compareTo(a.favorites!));
        emit(state.copyWith(data: filteredAndSorted));
        break;
      case 'MEMBERS':
        final filteredAndSorted = state.filterData
            .where((e) => e.members != null && e.members! > 0)
            .toList()
          ..sort((a, b) => b.members!.compareTo(a.members!));
        emit(state.copyWith(data: filteredAndSorted));
        break;
      case 'POPULARITY':
        final filteredAndSorted = state.filterData
            .where((e) => e.popularity != null && e.popularity! > 0)
            .toList()
          ..sort((a, b) => b.popularity!.compareTo(a.popularity!));
        emit(state.copyWith(data: filteredAndSorted));
        break;
      default:
        emit(state.copyWith(data: state.filterData));
    }
  }
}
