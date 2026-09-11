import 'package:hive_flutter/adapters.dart';

import '../models/service_model.dart';

class FavoritesLocalDataSource {
 final Box<ServiceModel> _box;

  FavoritesLocalDataSource(this._box);

  List<ServiceModel> getFavorites() {
    return _box.values.toList();
  }

  Future<void> addFavorite(ServiceModel service) async {
    await _box.put(service.id, service);
  }

  Future<void> removeFavorite(int serviceId) async {
    await _box.delete(serviceId);
  }

  bool isFavorite(int serviceId) {
    return _box.containsKey(serviceId);
  }
}