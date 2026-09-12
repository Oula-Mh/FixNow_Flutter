import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/constants/app_keys.dart';
import 'core/providers/theme_provider.dart';
import 'core/theme/app_theme.dart';
import 'models/service_model.dart';
import 'models/service_provider_model.dart';
import 'views/splash_view.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();

  Hive.registerAdapter(ServiceProviderModelAdapter()); 
  Hive.registerAdapter(ServiceModelAdapter());       

  //  Box<ServiceModel> _ = await Hive.openBox<ServiceModel>(AppKeys.favouriteBox);
  // Box<ServiceModel> _=  await Hive.openBox<ServiceModel>(AppKeys.cartBox);
    await Hive.openBox<ServiceModel>(AppKeys.favouriteBox);
 await Hive.openBox<ServiceModel>(AppKeys.cartBox);

 runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final themeMode = ref.watch(themeNotifierProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.ligthTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const SplashView(),
    );
  }
}
