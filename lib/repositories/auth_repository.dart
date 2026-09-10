import '../core/models/user_session.dart';
import '../core/network/network_exceptions.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../models/login_model.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepository(this._remoteDataSource, this._localDataSource);

  Future<void> login(LoginModel model) async {
    try {
      final session = await _remoteDataSource.login(model);
      await _localDataSource.saveSession(session);
    } catch (e) {
      throw NetworkExceptions.getErrorMessage(e);
    }
  }

  Future<UserSession?> getSession() {
    return _localDataSource.getSession();
  }

  Future<void> logout() async {
    await _remoteDataSource.logout();
    await _localDataSource.clearSession();
  }
}
