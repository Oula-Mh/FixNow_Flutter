import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/app_keys.dart';
import '../models/user_session.dart';

class SecureSessionStorage {
  final FlutterSecureStorage _storage;

  SecureSessionStorage(this._storage);

  Future<void> saveSession(UserSession session) async {
    await _storage.write(
      key: AppKeys.accessToken,
      value: session.accessToken,
    );

    if (session.refreshToken != null) {
      await _storage.write(
        key: AppKeys.refreshToken,
        value: session.refreshToken,
      );
    }
  }

  Future<UserSession?> getSession() async {
    final accessToken = await _storage.read(
      key: AppKeys.accessToken,
    );

    final refreshToken = await _storage.read(
      key: AppKeys.refreshToken,
    );

    if (accessToken == null || accessToken.isEmpty) {
      return null;
    }

    return UserSession(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  Future<void> clearSession() async {
    await _storage.delete(key: AppKeys.accessToken);
    await _storage.delete(key: AppKeys.refreshToken);
  }
}