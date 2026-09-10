import '../core/storage/secure_session_storage.dart';
import '../core/models/user_session.dart';

class AuthLocalDataSource {
  final SecureSessionStorage _storage;

  AuthLocalDataSource(this._storage);

  Future<void> saveSession(UserSession session) {
    return _storage.saveSession(session);
  }

  Future<UserSession?> getSession() {
    return _storage.getSession();
  }

  Future<void> clearSession() {
    return _storage.clearSession();
  }
}