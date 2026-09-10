import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/config/di.dart';
import '../models/service_model.dart';


final servicesProvider = AsyncNotifierProvider<ServicesNotifier, List<ServiceModel>>(
  ServicesNotifier.new,
);

class ServicesNotifier extends AsyncNotifier<List<ServiceModel>> {

  @override
  Future<List<ServiceModel>> build() async {
    var repository = ref.read(servicesRepositoryProvider);

    return await repository.getAllServices();
  }

 
}