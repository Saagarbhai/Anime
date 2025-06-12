import 'package:anime/core/utils/app_export.dart';

abstract class DetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadAnimeDetail extends DetailEvent {
  final int id;

  LoadAnimeDetail(this.id);

  @override
  List<Object> get props => [id];
}
