// Main Anime Model
class Anime {
  final int malId;
  final String url;
  final AnimeImages images;
  final AnimeTrailer trailer;
  final bool approved;
  final List<AnimeTitle> titles;
  final String title;
  final String? titleEnglish;
  final String titleJapanese;
  final List<String> titleSynonyms;
  final String type;
  final String source;
  final int? episodes;
  final String status;
  final bool airing;
  final AnimeAired aired;
  final String duration;
  final String rating;
  final double? score;
  final int? scoredBy;
  final int? rank;
  final int? popularity;
  final int? members;
  final int? favorites;
  final String synopsis;
  final String background;
  final String? season;
  final int? year;
  final AnimeBroadcast broadcast;
  final List<AnimeProducer> producers;
  final List<AnimeProducer> licensors;
  final List<AnimeProducer> studios;
  final List<AnimeGenre> genres;
  final List<AnimeGenre> explicitGenres;
  final List<AnimeGenre> themes;
  final List<AnimeGenre> demographics;

  const Anime({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    this.titleEnglish,
    required this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    required this.synopsis,
    required this.background,
    this.season,
    this.year,
    required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: AnimeImages.fromJson(json['images'] as Map<String, dynamic>),
      trailer: AnimeTrailer.fromJson(json['trailer'] as Map<String, dynamic>),
      approved: json['approved'] as bool,
      titles: (json['titles'] as List<dynamic>)
          .map((e) => AnimeTitle.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      titleEnglish: json['title_english'] as String?,
      titleJapanese: json['title_japanese'] as String,
      titleSynonyms: (json['title_synonyms'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      type: json['type'] as String,
      source: json['source'] as String,
      episodes: json['episodes'] != null ? json['episodes'] as int : null,
      status: json['status'] as String,
      airing: json['airing'] as bool,
      aired: AnimeAired.fromJson(json['aired'] as Map<String, dynamic>),
      duration: json['duration'] as String,
      rating: json['rating'] as String,
      score: json['score'] != null ? (json['score'] as num).toDouble() : null,
      scoredBy: json['scored_by'] != null ? json['scored_by'] as int : null,
      rank: json['rank'] != null ? json['rank'] as int : null,
      popularity: json['popularity'] != null ? json['popularity'] as int : null,
      members: json['members'] != null ? json['members'] as int : null,
      favorites: json['favorites'] != null ? json['favorites'] as int : null,
      synopsis: json['synopsis'] as String,
      background: json['background'] as String,
      season: json['season'] as String?,
      year: json['year'] as int?,
      broadcast:
          AnimeBroadcast.fromJson(json['broadcast'] as Map<String, dynamic>),
      producers: (json['producers'] as List<dynamic>)
          .map((e) => AnimeProducer.fromJson(e as Map<String, dynamic>))
          .toList(),
      licensors: (json['licensors'] as List<dynamic>)
          .map((e) => AnimeProducer.fromJson(e as Map<String, dynamic>))
          .toList(),
      studios: (json['studios'] as List<dynamic>)
          .map((e) => AnimeProducer.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => AnimeGenre.fromJson(e as Map<String, dynamic>))
          .toList(),
      explicitGenres: (json['explicit_genres'] as List<dynamic>)
          .map((e) => AnimeGenre.fromJson(e as Map<String, dynamic>))
          .toList(),
      themes: (json['themes'] as List<dynamic>)
          .map((e) => AnimeGenre.fromJson(e as Map<String, dynamic>))
          .toList(),
      demographics: (json['demographics'] as List<dynamic>)
          .map((e) => AnimeGenre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class AnimeImages {
  final ImageFormat jpg;
  final ImageFormat webp;

  const AnimeImages({
    required this.jpg,
    required this.webp,
  });

  factory AnimeImages.fromJson(Map<String, dynamic> json) {
    return AnimeImages(
      jpg: ImageFormat.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: ImageFormat.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }
}

class ImageFormat {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  const ImageFormat({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory ImageFormat.fromJson(Map<String, dynamic> json) {
    return ImageFormat(
      imageUrl: json['image_url'] as String,
      smallImageUrl: json['small_image_url'] as String,
      largeImageUrl: json['large_image_url'] as String,
    );
  }
}

class AnimeTrailer {
  final String? youtubeId;
  final String? url;
  final String? embedUrl;
  final TrailerImages images;

  const AnimeTrailer({
    this.youtubeId,
    this.url,
    this.embedUrl,
    required this.images,
  });

  factory AnimeTrailer.fromJson(Map<String, dynamic> json) {
    return AnimeTrailer(
      youtubeId: json['youtube_id'] as String?,
      url: json['url'] as String?,
      embedUrl: json['embed_url'] as String?,
      images: TrailerImages.fromJson(json['images'] as Map<String, dynamic>),
    );
  }
}

class TrailerImages {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? mediumImageUrl;
  final String? largeImageUrl;
  final String? maximumImageUrl;

  const TrailerImages({
    this.imageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.maximumImageUrl,
  });

  factory TrailerImages.fromJson(Map<String, dynamic> json) {
    return TrailerImages(
      imageUrl: json['image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
      mediumImageUrl: json['medium_image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
      maximumImageUrl: json['maximum_image_url'] as String?,
    );
  }
}

class AnimeTitle {
  final String type;
  final String title;

  const AnimeTitle({
    required this.type,
    required this.title,
  });

  factory AnimeTitle.fromJson(Map<String, dynamic> json) {
    return AnimeTitle(
      type: json['type'] as String,
      title: json['title'] as String,
    );
  }
}

class AnimeAired {
  final String? from;
  final String? to;
  final AnimeAiredProp prop;
  final String string;

  const AnimeAired({
    this.from,
    this.to,
    required this.prop,
    required this.string,
  });

  factory AnimeAired.fromJson(Map<String, dynamic> json) {
    return AnimeAired(
      from: json['from'] as String?,
      to: json['to'] as String?,
      prop: AnimeAiredProp.fromJson(json['prop'] as Map<String, dynamic>),
      string: json['string'] as String,
    );
  }
}

class AnimeAiredProp {
  final AnimeDate from;
  final AnimeDate to;

  const AnimeAiredProp({
    required this.from,
    required this.to,
  });

  factory AnimeAiredProp.fromJson(Map<String, dynamic> json) {
    return AnimeAiredProp(
      from: AnimeDate.fromJson(json['from'] as Map<String, dynamic>),
      to: AnimeDate.fromJson(json['to'] as Map<String, dynamic>),
    );
  }
}

class AnimeDate {
  final int? day;
  final int? month;
  final int? year;

  const AnimeDate({
    this.day,
    this.month,
    this.year,
  });

  factory AnimeDate.fromJson(Map<String, dynamic> json) {
    return AnimeDate(
      day: json['day'] as int?,
      month: json['month'] as int?,
      year: json['year'] as int?,
    );
  }
}

class AnimeBroadcast {
  final String? day;
  final String? time;
  final String? timezone;
  final String? string;

  const AnimeBroadcast({
    this.day,
    this.time,
    this.timezone,
    this.string,
  });

  factory AnimeBroadcast.fromJson(Map<String, dynamic> json) {
    return AnimeBroadcast(
      day: json['day'] as String?,
      time: json['time'] as String?,
      timezone: json['timezone'] as String?,
      string: json['string'] as String?,
    );
  }
}

class AnimeProducer {
  final int malId;
  final String type;
  final String name;
  final String url;

  const AnimeProducer({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory AnimeProducer.fromJson(Map<String, dynamic> json) {
    return AnimeProducer(
      malId: json['mal_id'] as int,
      type: json['type'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}

class AnimeGenre {
  final int malId;
  final String type;
  final String name;
  final String url;

  const AnimeGenre({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory AnimeGenre.fromJson(Map<String, dynamic> json) {
    return AnimeGenre(
      malId: json['mal_id'] as int,
      type: json['type'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}
