import 'package:dartz/dartz.dart';
import 'package:feature_first_structure/core/network/networking_api_client.dart';
import 'package:feature_first_structure/features/sample_feature/data/models/sample_model.dart';

/// A sample repository class for fetching sample data from the API.
class SampleRepository {
  /// Creates a new instance of [SampleRepository].
  SampleRepository(this._apiClient);

  final NetworkingApiClient _apiClient;

  /// Fetches the sample data from the API.
  ///
  /// Returns a `Future<SampleResponse>` containing the API response.
  Future<Either<String, List<SampleModel>>> getSample() async {
    return _apiClient.getSample();
  }
}
