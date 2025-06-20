import 'package:anime/core/utils/app_export.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadSearchDataEvent extends SearchEvent {}

class OnSearchTextChangeEvent extends SearchEvent {
  final String query;

  OnSearchTextChangeEvent(this.query);

  @override
  List<Object> get props => [query];
}

class OnFilterChangeEvent extends SearchEvent {
  final String filter;

  OnFilterChangeEvent({required this.filter});

  @override
  List<Object> get props => [filter];
}
