import '../../core/utils/app_export.dart';

class HomeState extends Equatable {
  final List<Anime> tvData;
  final List<Anime> movieData;
  final List<Anime> data;
  final Status homeStatus;
  final String errorMessage;
  final PageController pageController = PageController();

  HomeState(
      {this.tvData = const [],
      this.movieData = const [],
      this.data = const [],
      this.homeStatus = Status.init,
      this.errorMessage = '',
      PageController? pageController});

  HomeState copyWith(
      {List<Anime>? data,
      List<Anime>? tvData,
      List<Anime>? movieData,
      Status? homeStatus,
      String? errorMessage,
      String? imageUrl}) {
    return HomeState(
        data: data ?? this.data,
        tvData: tvData ?? this.tvData,
        movieData: movieData ?? this.movieData,
        homeStatus: homeStatus ?? this.homeStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        pageController: pageController);
  }

  @override
  List<Object?> get props => [data, homeStatus, errorMessage, pageController];
}
