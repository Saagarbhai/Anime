import '../../core/utils/app_export.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadHomePageData extends HomeEvent {}
