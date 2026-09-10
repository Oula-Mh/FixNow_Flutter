import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../core/providers/app_session_provider.dart';
import '../core/theme/app_theme.dart';
import 'login_view.dart';
import 'main_layout.dart';
import 'onboarding_view.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<AuthStatus>>(appSessionProvider, (previous, next) {
      next.whenOrNull(
        data: (status) {
          switch (status) {
            case AuthStatus.onboarding:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const OnboardingView()),
              );
              break;
            case AuthStatus.unauthenticated:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginView()),
              );
              break;
            case AuthStatus.authenticated:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MainLayout()),
              );
              break;
          }
        },
        error: (_, __) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginView()),
          );
        },
      );
    });

    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Image.asset("assets/images/Logo & Branding.png"),
                ),
              ),
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}