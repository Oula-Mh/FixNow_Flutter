import 'package:hive_flutter/adapters.dart';
import '../models/service_model.dart';

class CartLocalDataSource {
  final Box<ServiceModel> _box;

  CartLocalDataSource(this._box);

  List<ServiceModel> getCartItems() {
    return _box.values.toList();
  }

  Future<void> addToCart(ServiceModel service) async {
    await _box.put(service.id, service);
  }

  Future<void> removeFromCart(int serviceId) async {
    await _box.delete(serviceId);
  }

  Future<void> clearCart() async {
    await _box.clear();
  }

  bool isInCart(int serviceId) {
    return _box.containsKey(serviceId);
  }
}