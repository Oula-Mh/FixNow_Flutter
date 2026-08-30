import 'package:fixnow/core/config/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_keys.dart';


class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    final isDark =
        getIt.get<SharedPreferences>().getBool(AppKeys.isDarkThemeKey) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    final isCurrentDark = state == ThemeMode.dark;
    final newThemeMode = isCurrentDark ? ThemeMode.light : ThemeMode.dark;
    
    state = newThemeMode;

    await getIt
        .get<SharedPreferences>()
        .setBool(AppKeys.isDarkThemeKey, newThemeMode == ThemeMode.dark);
  }
}

final themeNotifierProvider =
    NotifierProvider<ThemeNotifier, ThemeMode>(ThemeNotifier.new);