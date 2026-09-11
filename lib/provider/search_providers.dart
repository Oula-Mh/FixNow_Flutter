import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/service_model.dart';
import 'services_provider.dart'; 

final searchQueryProvider = NotifierProvider<SearchQueryNotifier, String>(() {
  return SearchQueryNotifier();
});

class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void updateQuery(String query) {
    state = query;
  }

  void clear() {
    state = '';
  }
}

final searchResultProvider = Provider<List<ServiceModel>>((ref) {
  final services = ref.watch(servicesProvider).value ?? [];
  final query = ref.watch(searchQueryProvider).trim().toLowerCase();

  if (query.isEmpty) return services;
  return services.where((s) => (s.name?.toLowerCase() ?? '').contains(query)).toList();
});