import 'package:anime/core/utils/app_export.dart';

class HomeRepository {
  final ApiClient apiClient;

  HomeRepository({required this.apiClient});

  Future<List<Anime>> getAnimeData() async {
    try {
      final response =
          await apiClient.request(RequestType.GET, ApiEndPoint.animeIdUrl);
      final List<dynamic> data = response['data'];
      return data.map((animeJson) => Anime.fromJson(animeJson)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
