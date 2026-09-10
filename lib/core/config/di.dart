import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data_sources/auth_local_data_source.dart';
import '../../data_sources/auth_remote_data_source.dart';
import '../../repositories/auth_repository.dart';
import '../constants/api_constants.dart';
import '../storage/app_preferences.dart';
import '../storage/secure_session_storage.dart';


final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final storage = ref.read(secureSessionStorageProvider);
        final session = await storage.getSession();

        if (session != null && session.accessToken.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer ${session.accessToken}';
        }

        return handler.next(options);
      },
    ),
  );

  return dio;
});


final appPreferencesProvider = FutureProvider<AppPreferences>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return AppPreferences(prefs);
});

final secureSessionStorageProvider = Provider<SecureSessionStorage>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return SecureSessionStorage(storage);
});



final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  final storage = ref.watch(secureSessionStorageProvider);
  return AuthLocalDataSource(storage);
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDataSource(dio);
});


final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final localDataSource = ref.watch(authLocalDataSourceProvider);
  return AuthRepository(remoteDataSource, localDataSource);
});