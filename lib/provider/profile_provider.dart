import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/config/di.dart';
import '../models/profile_modle.dart';


final profileProvider = AsyncNotifierProvider<ProfileNotifier, ProfileModel>(
  ProfileNotifier.new,
);

class ProfileNotifier extends AsyncNotifier<ProfileModel> {

  @override
  Future<ProfileModel> build() async {
    var repository = ref.read(profileRepositoryProvider);

    return await repository.getInfoProfile();
  }

 
}