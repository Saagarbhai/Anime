import 'package:anime/core/utils/app_export.dart';

class SearchState extends Equatable {
  final List<Anime> data;
  final List<Anime> filterData;
  final Status searchStatus;
  final String errorMessage;

  const SearchState({
    this.data = const [],
    this.filterData = const [],
    this.searchStatus = Status.init,
    this.errorMessage = '',
  });

  SearchState copyWith(
      {List<Anime>? data,
      List<Anime>? filterData,
      Status? searchStatus,
      String? errorMessage}) {
    return SearchState(
        data: data ?? this.data,
        filterData: filterData ?? this.filterData,
        searchStatus: searchStatus ?? this.searchStatus,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [data, filterData, searchStatus, errorMessage];
}
