import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/config/di.dart';
import '../models/service_model.dart';

final cartProvider = AsyncNotifierProvider<CartNotifier, List<ServiceModel>>(() {
  return CartNotifier();
});

class CartNotifier extends AsyncNotifier<List<ServiceModel>> {
  @override
  Future<List<ServiceModel>> build() async {
    final repository = ref.read(cartRepositoryProvider);
    return repository.getCartItems();
  }

  Future<void> addToCart(ServiceModel service) async {
    final repository = ref.read(cartRepositoryProvider);
    try {
      await repository.addToCart(service);
      state = AsyncData(repository.getCartItems());
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> removeFromCart(int serviceId) async {
    final repository = ref.read(cartRepositoryProvider);
    try {
      await repository.removeFromCart(serviceId);
      state = AsyncData(repository.getCartItems());
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  bool isInCart(int serviceId) {
    final currentCart = state.value ?? [];
    return currentCart.any((element) => element.id == serviceId);
  }

  double get subtotal {
    final items = state.value ?? [];
    return items.fold(0.0, (sum, item) => sum + (item.price ?? 0.0));
  }
}