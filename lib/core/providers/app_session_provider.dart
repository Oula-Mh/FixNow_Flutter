
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/login_model.dart';
import '../../repositories/auth_repository.dart';
import '../config/di.dart';
import '../storage/app_preferences.dart';

enum AuthStatus {
  onboarding,
  authenticated,
  unauthenticated,
}

final appSessionProvider =
    AsyncNotifierProvider<AppSessionNotifier, AuthStatus>(
  AppSessionNotifier.new,
);

class AppSessionNotifier extends AsyncNotifier<AuthStatus> {
  late final AuthRepository _repository;
  late final AppPreferences _appPreferences;
  @override
  Future<AuthStatus> build() async {
await Future.delayed(const Duration(seconds: 1));

    _repository = ref.watch(authRepositoryProvider);
    _appPreferences = await ref.watch(appPreferencesProvider.future);

    if (!_appPreferences.isOnboardingCompleted()) {
      return AuthStatus.onboarding;
    }

    final session = await _repository.getSession();
    if (session != null && session.accessToken.isNotEmpty) {
      return AuthStatus.authenticated;
    }

    return AuthStatus.unauthenticated;
  }

  Future<void> completeOnboarding() async {
    await _appPreferences.completeOnboarding();
    state = const AsyncData(AuthStatus.unauthenticated);
  }

  Future<void> login(LoginModel model) async {
    state = const AsyncLoading();

    try {
      await _repository.login(model);
      state = const AsyncData(AuthStatus.authenticated);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> logout() async {
    try {
      await _repository.logout();
    } catch (e) {
      print('Logout Error: $e');
    } finally {
      state = const AsyncData(AuthStatus.unauthenticated);
    }
  }
}