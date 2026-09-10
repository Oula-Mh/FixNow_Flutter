import '../core/network/network_exceptions.dart';
import '../data_sources/service/service_remote_data_source.dart';
import '../models/service_model.dart';

class ServicesRepository {
  final ServiceRemoteDataSource _remoteDataSource;

  ServicesRepository(this._remoteDataSource);

  Future<List<ServiceModel>> getAllServices() async {
    try {
      return await _remoteDataSource.getAllServices();
    } catch (e) {
      throw NetworkExceptions.getErrorMessage(e);
    }
  }
}