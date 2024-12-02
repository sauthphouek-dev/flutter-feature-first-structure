import 'dart:async';
import 'dart:developer';

import 'package:feature_first_structure/core/storage/storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenStorage {
  TokenStorage({
    required Storage storage,
  }) : _storage = storage;

  final Storage _storage;

  static const String __accessToken = '__accessToken';
  static const String __refreshToken = '__refreshToken';

  // streaming token
  final _accessTokenStream = StreamController<String?>.broadcast();
  final _refreshTokenStream = StreamController<String?>.broadcast();

  Stream<String?> get accessTokenStream => _accessTokenStream.stream;

  Stream<String?> get refreshTokenStream => _refreshTokenStream.stream;

  Future<void> writeToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    log('writeToken: accessToken: $accessToken, refreshToken: $refreshToken');
    await Future.wait([
      _storage.write(key: accessToken, value: accessToken),
      _storage.write(key: __refreshToken, value: refreshToken),
    ]);
    _accessTokenStream.add(accessToken);
    _refreshTokenStream.add(refreshToken);
  }

  // get token
  Future<List<String?>> readToken() async {
    final token = await Future.wait([
      _storage.read(key: __accessToken),
      _storage.read(key: __refreshToken),
    ]);
    _accessTokenStream.add(token[0]);
    _refreshTokenStream.add(token[1]);
    return token;
  }

  // clear token
  Future<void> clearToken() async {
    await Future.wait([
      _storage.delete(key: __accessToken),
      _storage.delete(key: __refreshToken),
    ]);
    _accessTokenStream.add(null);
    _refreshTokenStream.add(null);
  }

  // clear access token
  Future<void> clearAccessToken() async {
    await _storage.delete(key: __accessToken);
    _accessTokenStream.add(null);
  }

  // get access token expired in seconds
  Future<Duration> getAccessTokenDuration() async {
    final token = await _storage.read(key: __accessToken);
    if (token != null) {
      final tokenData = JwtDecoder.decode(token);
      final tokenExp = tokenData['exp'];
      Duration tokenDuration;
      if (tokenExp is int) {
        tokenDuration = Duration(seconds: tokenExp);
      } else if (tokenExp is double) {
        tokenDuration = Duration(seconds: tokenExp.toInt());
      } else {
        tokenDuration = Duration.zero;
      }
      final now = DateTime.now();
      final tokenExpire =
          DateTime.fromMillisecondsSinceEpoch(tokenDuration.inMilliseconds);
      final tokenDurationLeft = tokenExpire.difference(now);
      return tokenDurationLeft;
    } else {
      return Duration.zero;
    }
  }

  // get refresh token expired in seconds
  Future<Duration> getRefreshTokenDuration() async {
    final token = await _storage.read(key: __refreshToken);
    if (token != null) {
      final tokenData = JwtDecoder.decode(token);
      final tokenExp = tokenData['exp'];
      Duration tokenDuration;
      if (tokenExp is int) {
        tokenDuration = Duration(seconds: tokenExp);
      } else if (tokenExp is double) {
        tokenDuration = Duration(seconds: tokenExp.toInt());
      } else {
        tokenDuration = Duration.zero;
      }
      final now = DateTime.now();
      final tokenExpire =
          DateTime.fromMillisecondsSinceEpoch(tokenDuration.inMilliseconds);
      final tokenDurationLeft = tokenExpire.difference(now);
      return tokenDurationLeft;
    } else {
      return Duration.zero;
    }
  }

  // get access token as String
  Future<String?> getAccessToken() async {
    final token = await _storage.read(key: __accessToken);
    return token;
  }

  // get refresh token as String
  Future<String?> getRefreshToken() async {
    final token = await _storage.read(key: __refreshToken);
    return token;
  }
}
