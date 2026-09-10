import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/di.dart';
import '../constants/app_keys.dart';

final themeNotifierProvider =
    NotifierProvider<ThemeNotifier, ThemeMode>(ThemeNotifier.new);

class ThemeNotifier extends Notifier<ThemeMode> {


  @override
  ThemeMode build() {
    final prefs = ref.watch(sharedPreferencesProvider).value;
    
    final isDark = prefs?.getBool(AppKeys.isDarkTheme) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    final isCurrentDark = state == ThemeMode.dark;
    final newThemeMode = isCurrentDark ? ThemeMode.light : ThemeMode.dark;

    state = newThemeMode;

    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setBool(AppKeys.isDarkTheme, newThemeMode == ThemeMode.dark);
  }
}