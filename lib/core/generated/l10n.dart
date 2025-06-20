// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Lang {
  Lang();

  static Lang? _current;

  static Lang get current {
    assert(
      _current != null,
      'No instance of Lang was loaded. Try to initialize the Lang delegate before accessing Lang.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Lang> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Lang();
      Lang._current = instance;

      return instance;
    });
  }

  static Lang of(BuildContext context) {
    final instance = Lang.maybeOf(context);
    assert(
      instance != null,
      'No instance of Lang present in the widget tree. Did you add Lang.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static Lang? maybeOf(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  /// `Anime App`
  String get apptitle {
    return Intl.message('Anime App', name: 'apptitle', desc: '', args: []);
  }

  /// `Rating`
  String get lbl_rating {
    return Intl.message('Rating', name: 'lbl_rating', desc: '', args: []);
  }

  /// `Anime`
  String get appbar_title {
    return Intl.message('Anime', name: 'appbar_title', desc: '', args: []);
  }

  /// `All Anime`
  String get lbl_allAnime {
    return Intl.message('All Anime', name: 'lbl_allAnime', desc: '', args: []);
  }

  /// `Image unavailable`
  String get error_imageUnvailable {
    return Intl.message(
      'Image unavailable',
      name: 'error_imageUnvailable',
      desc: '',
      args: [],
    );
  }

  /// `Poppins`
  String get text_poppins {
    return Intl.message('Poppins', name: 'text_poppins', desc: '', args: []);
  }

  /// `Members: `
  String get lbl_members {
    return Intl.message('Members: ', name: 'lbl_members', desc: '', args: []);
  }

  /// `Filter`
  String get lbl_filter {
    return Intl.message('Filter', name: 'lbl_filter', desc: '', args: []);
  }

  /// `Tv Anime`
  String get lbl_tv {
    return Intl.message('Tv Anime', name: 'lbl_tv', desc: '', args: []);
  }

  /// `Movie Anime`
  String get lbl_movie {
    return Intl.message('Movie Anime', name: 'lbl_movie', desc: '', args: []);
  }

  /// `Episodes`
  String get lbl_episode {
    return Intl.message('Episodes', name: 'lbl_episode', desc: '', args: []);
  }

  /// `Score`
  String get lbl_score {
    return Intl.message('Score', name: 'lbl_score', desc: '', args: []);
  }

  /// `Rank`
  String get lbl_rank {
    return Intl.message('Rank', name: 'lbl_rank', desc: '', args: []);
  }

  /// `Aired`
  String get lbl_aried {
    return Intl.message('Aired', name: 'lbl_aried', desc: '', args: []);
  }

  /// `Type`
  String get lbl_type {
    return Intl.message('Type', name: 'lbl_type', desc: '', args: []);
  }

  /// `Status`
  String get lbl_status {
    return Intl.message('Status', name: 'lbl_status', desc: '', args: []);
  }

  /// `Source`
  String get lbl_source {
    return Intl.message('Source', name: 'lbl_source', desc: '', args: []);
  }

  /// `Duration`
  String get lbl_duration {
    return Intl.message('Duration', name: 'lbl_duration', desc: '', args: []);
  }

  /// `Trailer`
  String get lbl_trailer {
    return Intl.message('Trailer', name: 'lbl_trailer', desc: '', args: []);
  }

  /// `Available`
  String get lbl_available {
    return Intl.message('Available', name: 'lbl_available', desc: '', args: []);
  }

  /// `N/A`
  String get lbl_na {
    return Intl.message('N/A', name: 'lbl_na', desc: '', args: []);
  }

  /// `Watch Trailer`
  String get lbl_watchTrailer {
    return Intl.message(
      'Watch Trailer',
      name: 'lbl_watchTrailer',
      desc: '',
      args: [],
    );
  }

  /// `Producers :`
  String get lbl_producers {
    return Intl.message(
      'Producers :',
      name: 'lbl_producers',
      desc: '',
      args: [],
    );
  }

  /// `Genres :`
  String get lbl_genres {
    return Intl.message('Genres :', name: 'lbl_genres', desc: '', args: []);
  }

  /// `Themes :`
  String get lbl_themes {
    return Intl.message('Themes :', name: 'lbl_themes', desc: '', args: []);
  }

  /// `Broadcast`
  String get lbl_broadcast {
    return Intl.message('Broadcast', name: 'lbl_broadcast', desc: '', args: []);
  }

  /// `Day: `
  String get lbl_day {
    return Intl.message('Day: ', name: 'lbl_day', desc: '', args: []);
  }

  /// `Time: `
  String get lbl_time {
    return Intl.message('Time: ', name: 'lbl_time', desc: '', args: []);
  }

  /// `Timezone: `
  String get lbl_timezone {
    return Intl.message('Timezone: ', name: 'lbl_timezone', desc: '', args: []);
  }

  /// `Synopsis`
  String get lbl_synopsis {
    return Intl.message('Synopsis', name: 'lbl_synopsis', desc: '', args: []);
  }

  /// `Background`
  String get lbl_background {
    return Intl.message(
      'Background',
      name: 'lbl_background',
      desc: '',
      args: [],
    );
  }

  /// `More Info`
  String get lbl_moreInfo {
    return Intl.message('More Info', name: 'lbl_moreInfo', desc: '', args: []);
  }

  /// `Members: N/A`
  String get lbl_membersna {
    return Intl.message(
      'Members: N/A',
      name: 'lbl_membersna',
      desc: '',
      args: [],
    );
  }

  /// `Favorites: `
  String get lbl_favorites {
    return Intl.message(
      'Favorites: ',
      name: 'lbl_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Favorites: N/A`
  String get lbl_favoritesNA {
    return Intl.message(
      'Favorites: N/A',
      name: 'lbl_favoritesNA',
      desc: '',
      args: [],
    );
  }

  /// `Error loading image: `
  String get error_lbl_Errorloadingimage {
    return Intl.message(
      'Error loading image: ',
      name: 'error_lbl_Errorloadingimage',
      desc: '',
      args: [],
    );
  }

  /// `Search From Here...`
  String get search_hint {
    return Intl.message(
      'Search From Here...',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Lang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Lang> load(Locale locale) => Lang.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
