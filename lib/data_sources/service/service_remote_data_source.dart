import 'package:dio/dio.dart';

import '../../core/constants/api_constants.dart';
import '../../models/service_model.dart';

class ServiceRemoteDataSource {
  final Dio _dio;

  ServiceRemoteDataSource(this._dio);


  Future<List<ServiceModel>> getAllServices() async {

    Response response = await _dio.get(
    ApiConstants.services
    );

    List<ServiceModel> services = List.generate(
      response.data.length,
      (index) => ServiceModel.fromMap(response.data[index]),
    );

    return services;
  }
}