import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/config/di.dart';
import '../models/service_model.dart';


final favoritesProvider = AsyncNotifierProvider<FavoritesNotifier, List<ServiceModel>>(() {
  return FavoritesNotifier();
});

class FavoritesNotifier extends AsyncNotifier<List<ServiceModel>> {
  
  @override
  Future<List<ServiceModel>> build()async {
    final repository = ref.read(favoritesRepositoryProvider);
    return repository.getFavorites();
  }
 
Future<void> toggleFavorite(ServiceModel service) async {
  final repository = ref.read(favoritesRepositoryProvider);
  try {
    await repository.toggleFavorite(service); 
    final updatedList = repository.getFavorites();
    state = AsyncData(updatedList);
  } catch (error, stackTrace) {
    state = AsyncError(error, stackTrace);
  }
}

 bool isFavorite(int serviceId) {
  final currentFavorites = state.value ?? [];
  return currentFavorites.any((element) => element.id == serviceId);
}
}

