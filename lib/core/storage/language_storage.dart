import 'dart:async';

import 'package:feature_first_structure/core/storage/storage.dart';

/// {@template language_storage}
/// Language Storage
/// {@endtemplate}
class LanguageStorage {
  /// {@macro language_storage}
  LanguageStorage({
    required Storage storage,
  }) : _storage = storage;

  final Storage _storage;

  // default language
  static const String __defaultLanguage = 'en';

  static const String __language = '__language';

  // streaming language
  final _languageStream = StreamController<String?>.broadcast();

  Stream<String?> get languageStream => _languageStream.stream;

  Future<void> writeLanguage({
    required String language,
  }) async {
    /// using try catch to avoid error
    try {
      await _storage.write(key: __language, value: language);
      _languageStream.add(language);
    } catch (e) {
      // if error occurs, use default language
      await _storage.write(key: __language, value: __defaultLanguage);
      _languageStream.add(__defaultLanguage);
    }
  }

  // get language
  Future<String?> readLanguage() async {
    /// using try catch to avoid error
    try {
      final language = await _storage.read(key: __language);
      _languageStream.add(language);
      return language;
    } catch (e) {
      // if error occurs, use default language
      await _storage.write(key: __language, value: __defaultLanguage);
      _languageStream.add(__defaultLanguage);
      return __defaultLanguage;
    }
  }

  // clear language
  Future<void> clearLanguage() async {
    // using try catch to avoid error
    try {
      await _storage.delete(key: __language);
      _languageStream.add(null);
    } catch (e) {
      // if error occurs, use default language
      await _storage.write(key: __language, value: __defaultLanguage);
      _languageStream.add(__defaultLanguage);
    }
  }
}
