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
  String get rating {
    return Intl.message('Rating', name: 'rating', desc: '', args: []);
  }

  /// `Anime`
  String get appbar_title {
    return Intl.message('Anime', name: 'appbar_title', desc: '', args: []);
  }

  /// `All Anime`
  String get allAnime {
    return Intl.message('All Anime', name: 'allAnime', desc: '', args: []);
  }

  /// `Image unavailable`
  String get imageUnvailable {
    return Intl.message(
      'Image unavailable',
      name: 'imageUnvailable',
      desc: '',
      args: [],
    );
  }

  /// `Poppins`
  String get poppins {
    return Intl.message('Poppins', name: 'poppins', desc: '', args: []);
  }

  /// `Members`
  String get members {
    return Intl.message('Members', name: 'members', desc: '', args: []);
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Tv Anime`
  String get tv {
    return Intl.message('Tv Anime', name: 'tv', desc: '', args: []);
  }

  /// `Movie Anime`
  String get movie {
    return Intl.message('Movie Anime', name: 'movie', desc: '', args: []);
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
