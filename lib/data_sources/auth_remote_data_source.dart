import 'package:dio/dio.dart';

import '../core/constants/api_constants.dart';
import '../core/models/user_session.dart';
import '../models/login_model.dart';

class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  Future<UserSession> login(LoginModel model) async {
    final response = await _dio.post(
      ApiConstants.login,
      data: model.toMap(),
    );

    return UserSession.fromMap(
      response.data,
    );
  }

  Future<void> logout() async {
    await _dio.post(ApiConstants.logout);
  }
}