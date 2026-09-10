import 'package:dio/dio.dart';
import 'package:fixnow/core/constants/api_constants.dart';
import 'package:fixnow/models/profile_modle.dart';

class ProfileRemoteDataSource {
  final Dio _dio;
  ProfileRemoteDataSource(this._dio);

  Future<ProfileModel> getInfoProfile() async {
    Response response = await _dio.get(ApiConstants.profile);
    ProfileModel profile = ProfileModel.fromMap(response.data);
    return profile;
  }
}
