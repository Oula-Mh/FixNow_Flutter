import 'package:fixnow/models/profile_modle.dart';

import '../core/network/network_exceptions.dart';
import '../data_sources/profile/profile_remote_data_source.dart';

class ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;
  ProfileRepository(this._remoteDataSource);

  Future<ProfileModel> getInfoProfile() async {
    try {
      return await _remoteDataSource.getInfoProfile();
    } catch (e) {
      throw NetworkExceptions.getErrorMessage(e);
    }
  }
}
