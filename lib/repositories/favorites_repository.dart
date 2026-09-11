import '../models/service_model.dart';
import '../data_sources/favorites_local_data_source.dart';

class FavoritesRepository {
  final FavoritesLocalDataSource _localDataSource;

  FavoritesRepository(this._localDataSource);

  List<ServiceModel> getFavorites() {
    return _localDataSource.getFavorites();
  }

  Future<void> toggleFavorite(ServiceModel service) async {
    final isFav = _localDataSource.isFavorite(service.id!);
    if (isFav) {
      await _localDataSource.removeFavorite(service.id!);
    } else {
      await _localDataSource.addFavorite(service);
    }
  }

 
}