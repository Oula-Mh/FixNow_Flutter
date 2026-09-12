import '../models/service_model.dart';
import '../data_sources/cart_local_data_source.dart';

class CartRepository {
  final CartLocalDataSource _localDataSource;

  CartRepository(this._localDataSource);

  List<ServiceModel> getCartItems() => _localDataSource.getCartItems();

  Future<void> addToCart(ServiceModel service) => _localDataSource.addToCart(service);

  Future<void> removeFromCart(int serviceId) => _localDataSource.removeFromCart(serviceId);

  Future<void> clearCart() => _localDataSource.clearCart();

  bool isInCart(int serviceId) => _localDataSource.isInCart(serviceId);
}