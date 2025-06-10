import '../../core/utils/app_export.dart';

class HomeState extends Equatable {
  final List<Anime> data;
  final Status homeStatus;
  final String errorMessage;

  const HomeState(
      {this.data = const [],
      this.homeStatus = Status.init,
      this.errorMessage = ''});

  HomeState copyWith(
      {List<Anime>? data, Status? homeStatus, String? errorMessage}) {
    return HomeState(
        data: data ?? this.data,
        homeStatus: homeStatus ?? this.homeStatus,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [data, homeStatus, errorMessage];
}
