import '../../core/utils/app_export.dart';

class DetailState extends Equatable {
  final Anime? data;
  final Status detailPageStatus;
  final String errorMessage;

  const DetailState(
      {this.data, this.detailPageStatus = Status.init, this.errorMessage = ''});

  DetailState copyWith(
      {Anime? data, Status? detailPageStatus, String? errorMessage}) {
    return DetailState(
        data: data ?? this.data,
        detailPageStatus: detailPageStatus ?? this.detailPageStatus,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [data, detailPageStatus, errorMessage];
}
